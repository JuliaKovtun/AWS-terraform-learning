module "label" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name = var.name
}

data "aws_region" "current" {}

module "lambda_function_get_all_authors" {
  source = "terraform-aws-modules/lambda/aws"
  version = "3.2.0"

  function_name = "${module.label.id}-get-all-authors"
  description   = "get all authors"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  source_path = "${path.module}/lambda_source/get_all_authors/index.js"
  
  environment_variables = {
    TABLE_NAME = var.dynamo_db_authors_name
  }
  tags = module.label.tags
}
