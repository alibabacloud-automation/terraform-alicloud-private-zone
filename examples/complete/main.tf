data "alicloud_zones" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

module "pvtz_zone" {
  source = "../.."

  #alicloud_pvtz_zone
  create = true

  zone_name = "pvtz.com"
  remark    = var.remark

  #alicloud_pvtz_zone_record
  add_records = false

  #alicloud_pvtz_zone_attachment
  attach_vpc = false

}

module "pvtz_zone_record" {
  source = "../.."

  #alicloud_pvtz_zone
  create = false

  existing_zone_name = module.pvtz_zone.this_private_zone_name

  #alicloud_pvtz_zone_record
  add_records = true

  records = var.records

  #alicloud_pvtz_zone_attachment
  attach_vpc = false

}

module "pvtz_zone_attachment" {
  source = "../.."

  #alicloud_pvtz_zone
  create = false

  existing_zone_name = module.pvtz_zone.this_private_zone_name

  #alicloud_pvtz_zone_record
  add_records = false

  #alicloud_pvtz_zone_attachment
  attach_vpc = true

  vpc_ids        = [module.vpc.vpc_id]
  lang           = "zh"
  user_client_ip = "172.16.0.6"

}