# a module from tf registry
module "iam_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  account_alias = "reg-iam"
}
