data "alicloud_pvtz_zones" "this" {
  keyword = var.existing_zone_name
}

resource "random_uuid" "this" {}

locals {
  create        = var.existing_zone_name != "" ? false : var.create
  existing_zone = var.existing_zone_name != "" || var.create ? true : false
  zone_name     = var.zone_name != "" ? var.zone_name : substr("terraform-zone-${replace(random_uuid.this.result, "-", "")}", 0, 32)
  zone_id       = var.existing_zone_name != "" ? data.alicloud_pvtz_zones.this.zones[0].id : concat(alicloud_pvtz_zone.this.*.id, [""])[0]
  records       = length(var.records) > 0 ? var.records : var.record_list
  vpc_ids       = length(var.vpc_ids) > 0 ? var.vpc_ids : var.vpc_id_list
}

################################
# pvtz_zone
################################
resource "alicloud_pvtz_zone" "this" {
  count = local.create ? 1 : 0

  name   = local.zone_name
  remark = var.remark != "" ? var.remark : null
}

################################
# pvtz_zone_record
################################
resource "alicloud_pvtz_zone_record" "this" {
  count = local.existing_zone && var.add_records ? length(local.records) : 0

  zone_id         = local.zone_id
  resource_record = lookup(local.records[count.index], "rr", "") != "" ? lookup(local.records[count.index], "rr") : lookup(local.records[count.index], "name")
  type            = lookup(local.records[count.index], "type", "A")
  ttl             = lookup(local.records[count.index], "ttl", 60)
  value           = lookup(local.records[count.index], "value")
  priority        = lookup(local.records[count.index], "priority", 1)
}

################################
# pvtz_zone_attachment
################################
resource "alicloud_pvtz_zone_attachment" "this" {
  count = local.existing_zone && var.attach_vpc ? length(local.vpc_ids) : 0

  zone_id        = local.zone_id
  vpc_ids        = local.vpc_ids
  lang           = var.lang != "" ? var.lang : null
  user_client_ip = var.user_client_ip != "" ? var.user_client_ip : null
}
