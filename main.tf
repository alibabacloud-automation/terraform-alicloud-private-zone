provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/private-zone"
}

module "domain" {
  source       = "./modules/domain"
  domain_list  = [var.domain_name]
  domain_count = var.domain_name == "" ? 0 : 1
}

module "records" {
  source      = "./modules/record"
  zone_id     = module.domain.this_id
  record_list = var.record_list
}

module "attachment" {
  source          = "./modules/attachment"
  zone_id         = module.domain.this_id
  vpc_id_list     = var.vpc_id_list
  need_attachment = var.need_attachment
}

