# -------------------- Redirect --------------------

resource "aws_s3_bucket" "redirect" {
  bucket_prefix = var.redirect_domain_name

  website {
    redirect_all_requests_to = "https://${var.domain_name}"
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
      identifiers = ["*"]
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
  bucket_prefix =  var.domain_name

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "website_acl" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.website_iam.json
}

data "aws_iam_policy_document" "website_iam" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
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
  bucket = aws_s3_bucket.website.id
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