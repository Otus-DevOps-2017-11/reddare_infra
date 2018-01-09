provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket = "reddare-infra"
    prefix = "terraform/state/prod"
  }
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  app_disk_image  = "${var.app_disk_image}"
  app_name        = "${var.app_name}"
  puma_rule_name  = "${var.puma_rule_name}"
  mongodb = "${module.db.internal_ip}"
}

module "db" {
  source          = "../modules/db"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  db_disk_image   = "${var.db_disk_image}"
  db_name         = "${var.db_name}"
  mongo_rule_name = "${var.mongo_rule_name}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["46.188.72.15/32"]
}
