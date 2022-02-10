output "this_private_zone_records" {
  description = "List of the Private Zone records"
  value       = formatlist("%v   %64v : %10v   %5v   %v", concat(alicloud_pvtz_zone_record.this.*.id, [""])[0], concat(alicloud_pvtz_zone_record.this.*.resource_record, [""])[0], concat(alicloud_pvtz_zone_record.this.*.type, [""])[0], concat(alicloud_pvtz_zone_record.this.*.ttl, [""])[0], concat(alicloud_pvtz_zone_record.this.*.value, [""])[0])
}

output "this_private_zone_name" {
  description = "The name of Private Zone"
  value       = concat(alicloud_pvtz_zone.this.*.name, [""])[0]
}