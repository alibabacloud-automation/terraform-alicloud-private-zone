terraform-alicloud-private-zone 
===============================

Terraform模块用于在阿里云上创建 [Private Zone](https://help.aliyun.com/document_detail/64611.html)，同时您可以为 Zone 添加 records 并关联 VPC。

支持以下类型的资源：

* [PVTZ Zones](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone.html)
* [PVTZ Records](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_record.html)
* [PVTZ Attachment](https://www.terraform.io/docs/providers/alicloud/r/pvtz_zone_attachment.html)

## Terraform 版本

本 Module 要求使用 Terraform 0.12 和 阿里云 Provider 1.62.1+。

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

作者
-------
Created and maintained by Zhou qilin(z17810666992@163.com), He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)