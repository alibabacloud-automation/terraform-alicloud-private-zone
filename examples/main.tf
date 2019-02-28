module "pvtz" {
    source              = "../"
    domain_name           = "pvtz.com"
    vpc_id_list           = ["vpc-2zeidcz010hc6z2yc2pph","vpc-2zedlzeq6m4zr1jkowi94"]
    record_list           = [
      {
        name          = "www"
        type          = "A"
        ttl           = 600
        value           = "223.5.5.5"
        priority        = 1
      },
      {
        name          = "www"
        type          = "MX"
        ttl           = 600
        value           = "mx.aliyun.com"
        priority        = 1
      },
      {
        name          = "cname"
        type          = "CNAME"
        ttl           = 600
        value           = "mx.aliyun.com"
        priority        = 1
      }
  ]
}