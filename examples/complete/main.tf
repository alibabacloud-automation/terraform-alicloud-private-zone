module "vpc" {
  source          = "alibaba/vpc/alicloud"
  vpc_name        = "pvtz_test"
  vpc_cidr        = "192.168.0.0/16"
  vpc_description = "pvtz test vpc"
}

module "pvtz" {
  source = "../.."

  zone_name = "pvtz.com"
  vpc_ids   = [module.vpc.vpc_id]
  records = [
    {
      rr       = "aaa"
      type     = "A"
      ttl      = 600
      value    = "223.5.5.5"
      priority = 1
    },
    {
      rr       = "bbb"
      type     = "MX"
      ttl      = 600
      value    = "mx.aliyun.com"
      priority = 1
    },
    {
      rr       = "ccc"
      type     = "CNAME"
      ttl      = 600
      value    = "www.aliyun.com"
      priority = 1
    }
  ]
}
