import {
  to = aws_iam_policy.fluent_bit_cloudwatch
  id = "arn:aws:iam::315401414097:policy/FluentBitCloudWatchPolicy"
}

import {
  to = module.eks.aws_cloudwatch_log_group.this[0]
  id = "/aws/eks/app-migration/cluster"
}

import {
  to = module.eks.module.kms.aws_kms_alias.this["cluster"]
  id = "alias/eks/app-migration"
}