Terraform module which create Private Zone on Alibaba Cloud.  
terraform-alicloud-private-zone
-------------------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/blob/master/README-CN.md)

Terraform module which creates [Private Zone](https://help.aliyun.com/document_detail/64611.html) resources on Alibaba Cloud, add records and attach VPC. 

These types of resources are supported:

* [PVTZ Zones](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone.html)
* [PVTZ Records](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_record.html)
* [PVTZ Attachment](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_attachment.html)

## Terraform versions

The Module requires Terraform 0.12 and Terraform Provider AliCloud 1.62.1+.

## Usage

### Create a Private Zone.

Create a Private Zone without any record and VPC.

```hcl
module "pvtz" {
  source      = "terraform-alicloud-modules/private-zone/alicloud"
  zone_name   = "pvtz.com"
}
``` 

Create a Private Zone and add records.

```hcl
module "pvtz" {
  source      = "terraform-alicloud-modules/private-zone/alicloud"
  zone_name   = "pvtz.com"
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
    }
  ]
}
``` 

Create a Private Zone, add records and attach VPC.

```hcl
module "pvtz" {
  source      = "terraform-alicloud-modules/private-zone/alicloud"
  zone_name   = "pvtz.com"
  vpc_ids     = ["vpc-uf61gzxodh2w60l9n****"]
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
    }
  ]
}
``` 

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/examples/complete)


Authors
-------
Created and maintained by Zhou qilin(z17810666992@163.com), He Guimin(@xiaozhu36, heguimin36@163.com).

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
