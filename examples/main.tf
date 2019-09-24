module "pvtz" {
  source          = "../"
  domain_name     = "pvtz.com"
  vpc_id_list     = [module.vpc.vpc_id]
  need_attachment = true

  record_list = [{
      name     = "www"
      type     = "A"
      ttl      = 600
      value    = "223.5.5.5"
      priority = 1
    },
   {
      name     = "www"
      type     = "MX"
      ttl      = 600
      value    = "mx.aliyun.com"
      priority = 1
    },
   {
      name     = "cname"
      type     = "CNAME"
      ttl      = 600
      value    = "mx.aliyun.com"
      priority = 1
    },
]
}

module "vpc" {
  source          = "alibaba/vpc/alicloud"
  vpc_name        = "pvtz_test"
  vpc_cidr        = "192.168.0.0/16"
  vpc_description = "pvtz test vpc"
}

