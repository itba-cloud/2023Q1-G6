# -------------------- Redirect --------------------

resource "aws_s3_bucket" "redirect" {
  bucket = var.redirect_domain_name

  website {
    redirect_all_requests_to = "https://${var.domain_name}"
  }
}

resource "aws_s3_bucket_policy" "redirect" {
  bucket = aws_s3_bucket.redirect.id
  policy = data.aws_iam_policy_document.redirect.json
}

data "aws_iam_policy_document" "redirect" {
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
  bucket = var.domain_name

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.website.json
}

data "aws_iam_policy_document" "website" {
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


# -------------------- Log --------------------

resource "aws_s3_bucket" "log" {
  bucket = "log-bucket"
}

resource "aws_s3_bucket_acl" "log" {
  bucket = aws_s3_bucket.log.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "website" {
  bucket = aws_s3_bucket.website.id
  target_bucket = aws_s3_bucket.log.id
  target_prefix = "log/"
}