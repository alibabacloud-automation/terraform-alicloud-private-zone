Alicloud Private Zone Terraform Module
terraform-alicloud-private-zone
=============================================

Terraform module which creates Private Zone resources on Alibaba Cloud.

These types of resources are supported:

* [PVTZ Attachments](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_attachment.html)
* [PVTZ Zones](https://www.terraform.io/docs/providers/alicloud/d/pvtz_zones.html)
* [PVTZ Records](https://www.terraform.io/docs/providers/alicloud/d/pvtz_zone_records.html)

Root module calls these modules which can also be used separately to create independent resources:

* [attachment](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/modules/attachment) - attach zone id and vpc id
* [zone](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/modules/domain) - creates zone
* [record](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/modules/record) - creates records
- record_list means multiple record


`NOTE`:
* Domain (record) need follow RFC.

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


        module "pvtz" {
          source              = "terraform-alicloud-modules/private-zone/alicloud"
          domain_name           = "pvtz.com"
          vpc_id_list           = ["${module.vpc.vpc_id}"]
          need_attachment         = true
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

        module "vpc" {
          source              = "alibaba/vpc/alicloud"
          vpc_name            = "testVpc"
          vpc_cidr            = "192.168.0.0/16"
          vpc_description         = "pvtz test vpc"
        }

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain_name     | domain name which you want to add                                   | list   | -     | yes |
| record_list     | record list                                                         | list   | -     | yes |
| vpc_id_list     | the vpc id list what you want to attached                           | list   | -     | no  |
| need_attachment | attachment switch                                                   | bool   | false | no  |


## Outputs

| Name | Description |
|------|-------------|
| this_domain_name | domain name           |
| this_records     | record info list      |

Authors
-------
Created and maintained by Zeng Yichen(@microdustor easedust@aliyun.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
