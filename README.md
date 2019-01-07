Alicloud Private Zone Terraform Module
=============================================

Terraform module which creates Private Zone resources on Alibaba Cloud.

These types of resources are supported:

* [PVTZ Domains](https://www.terraform.io/docs/providers/alicloud/d/pvtz_zones.html)
* [PVTZ Records](https://www.terraform.io/docs/providers/alicloud/d/pvtz_zone_records.html)

Root module calls these modules which can also be used separately to create independent resources:

* [pvtz_domain](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/modules/domain) - creates domains
* [pvtz_record](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/modules/record) - creates records


`NOTE`:
* Domain (record) need follow RFC.

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


        module "record" {
          source      = "./modules/record"
          ttl         = "${var.record_ttl}"
          type        = "${var.record_type}"
          name        = "${var.record_name}"
          a_value     = "${var.a_value}"
          a_count     = "${var.a_count}"
          mx_priority = "${var.mx_priority}"
          domain_id   = "${module.domain.id}"
        }

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY


Authors
-------
Created and maintained by Zeng Yichen(@microdustor easedust@aliyun.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
