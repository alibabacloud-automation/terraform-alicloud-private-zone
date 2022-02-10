Terraform module which create Private Zone on Alibaba Cloud.  
terraform-alicloud-private-zone
-------------------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/blob/master/README-CN.md)

Terraform module which creates [Private Zone](https://help.aliyun.com/document_detail/64611.html) resources on Alibaba Cloud, add records and attach VPC. 

These types of resources are supported:

* [PVTZ Zones](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone.html)
* [PVTZ Records](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_record.html)
* [PVTZ Attachment](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_attachment.html)

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

## Notes
From the version v1.4.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/private-zone"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.3.0:

```hcl
module "pvtz" {
  source    = "terraform-alicloud-modules/private-zone/alicloud"
  version   = "1.3.0"
  region    = "cn-beijing"
  profile   = "Your-Profile-Name"
  zone_name = "pvtz.com"
  // ...
}
```

If you want to upgrade the module to 1.4.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "pvtz" {
  source    = "terraform-alicloud-modules/private-zone/alicloud"
  zone_name = "pvtz.com"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "pvtz" {
  source    = "terraform-alicloud-modules/private-zone/alicloud"
  providers = {
    alicloud = alicloud.bj
  }
  zone_name = "pvtz.com"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.62.1 |

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)