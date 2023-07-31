data "aws_caller_identity" "current" {}

resource "aws_iam_user" "external_secret_user" {
  name = "${local.lps}-iam-user"
  tags = merge(local.tags, {
    "atomi.cloud/type" = "aws_iam_user"
  })
}

resource "aws_iam_policy" "external_secret_policy" {
  name        = "${local.lps}-iam-policy"
  description = local.lps-fqdn

  # tfsec:ignore:aws-iam-no-policy-wildcards
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter",
          "ssm:ListTagsForResource",
          "ssm:DescribeParameters",
        ]
        Resource = "arn:aws:ssm:${var.aws_region}:${data.aws_caller_identity.current.account_id}:parameter/${var.landscape}/*"
      }
    ]
  })
  tags = merge(local.tags, {
    Type = "aws_iam_policy"
  })
}

resource "aws_iam_user_policy_attachment" "external_secret_access" {
  user       = aws_iam_user.external_secret_user.name
  policy_arn = aws_iam_policy.external_secret_policy.arn
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.external_secret_user.name
}