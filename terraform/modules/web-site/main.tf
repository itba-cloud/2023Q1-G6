# ---------------------------------------------------------------------------
# Amazon S3
# ---------------------------------------------------------------------------

# -------------------- Redirect --------------------

resource "aws_s3_bucket" "redirect" {
  bucket_prefix = var.redirect_domain_name
}

resource "aws_s3_bucket_website_configuration" "redirect_config" {
  bucket = aws_s3_bucket.redirect.id

  redirect_all_requests_to {
    protocol  = "http"
    host_name = var.domain_name
  }
}

resource "aws_s3_bucket_ownership_controls" "redirect" {
  bucket = aws_s3_bucket.redirect.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "redirect_policy" {
  bucket = aws_s3_bucket.redirect.id
  policy = data.aws_iam_policy_document.redirect_iam.json
}

data "aws_iam_policy_document" "redirect_iam" {
  statement {
    principals {
      type        = "AWS"
      identifiers = var.bucket_access_oai
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.redirect.arn,
      "${aws_s3_bucket.redirect.arn}/*",
    ]
  }
}


# -------------------- Website --------------------

resource "aws_s3_bucket" "website" {
  bucket_prefix = var.domain_name
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# 




resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "website_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.website,
    aws_s3_bucket_public_access_block.website,
  ]

  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

# resource "aws_s3_bucket_acl" "website_acl" {
#   bucket = aws_s3_bucket.website.id
#   acl    = "public-read"
# }

resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.website_iam.json
}

data "aws_iam_policy_document" "website_iam" {
  statement {
    principals {
      type        = "AWS"
      identifiers = var.bucket_access_oai
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.website.arn,
      "${aws_s3_bucket.website.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_logging" "website_log" {
  bucket        = aws_s3_bucket.website.id
  target_bucket = aws_s3_bucket.log.id
  target_prefix = "log/"
}


# -------------------- Log --------------------

resource "aws_s3_bucket" "log" {

  bucket_prefix = "log-bucket"
}

resource "aws_s3_bucket_ownership_controls" "log" {
  bucket = aws_s3_bucket.log.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "log_acl" {
  bucket = aws_s3_bucket.log.id
  acl    = "log-delivery-write"
}


# ==================bucket objects==================

# resource "aws_s3_bucket_object" "object" {
#   for-each=
#   bucket = ""
#   key    = "new_object_key"
#   source = "path/to/file"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   etag = filemd5("path/to/file")
# }

resource "aws_s3_object" "object" {
  for_each = fileset(var.static_resource_path, "**")
  bucket = aws_s3_bucket.website.id
  key = each.value
  source = "${var.static_resource_path}${each.value}"
  etag = filemd5("${var.static_resource_path}${each.value}")
}
