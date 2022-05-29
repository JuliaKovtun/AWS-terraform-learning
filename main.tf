module "course" {
  source       = "./modules/dynamodb"
  context      = module.base_labels.context
  name         = "course"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"
}

module "authors" {
  source       = "./modules/dynamodb"
  context      = module.base_labels.context
  name         = "authors"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"
}

module "lambda" {
  source   = "./modules/lambda"
  context = module.base_labels.context
  name = "lambda"
  dynamo_db_authors_name = module.authors.id
}















locals {
  user_table = "forum"
}

module "my_best_table_label" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.base_labels.context
  name = "my-best-table"
}

resource "aws_dynamodb_table" "this" {
  name         = module.my_best_table_label.id
  hash_key     = "TestTableHashKey"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}

module "s3" {
  source = "./modules/s3"
  context = module.base_labels.context
  bucket_name = "backend-1"
}

module "s3_new" {
  source = "./modules/s3"
  context = module.base_labels.context
  bucket_name = "frontend-1"
}
