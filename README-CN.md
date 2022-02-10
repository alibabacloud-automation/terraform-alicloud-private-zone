terraform-alicloud-private-zone 
===============================

Terraform模块用于在阿里云上创建 [Private Zone](https://help.aliyun.com/document_detail/64611.html)，同时您可以为 Zone 添加 records 并关联 VPC。

支持以下类型的资源：

* [PVTZ Zones](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone.html)
* [PVTZ Records](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_record.html)
* [PVTZ Attachment](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_attachment.html)

## 用法

### 创建一个新的 Private Zone

创建一个未添加 record，未关联 VPC 的 Private Zone。

```hcl
module "pvtz" {
  source      = "terraform-alicloud-modules/private-zone/alicloud"
  zone_name   = "pvtz.com"
}
``` 

创建一个 Private Zone 并添加 records。 

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

创建一个 Private Zone，添加 records 并关联 VPC。 

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

## 示例

* [Private-zone 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-private-zone/tree/master/examples/complete)

## 注意事项
本Module从版本v1.4.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/private-zone"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.3.0:

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

如果你想对正在使用中的Module升级到 1.4.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.62.1 |

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)