output "this_private_zone_records" {
  description = "List of the Private Zone records"
  value       = formatlist("%v   %64v : %10v   %5v   %v", alicloud_pvtz_zone_record.this.*.id, alicloud_pvtz_zone_record.this.*.resource_record, alicloud_pvtz_zone_record.this.*.type, alicloud_pvtz_zone_record.this.*.ttl, alicloud_pvtz_zone_record.this.*.value)
}

output "this_private_zone_name" {
  description = "The name of Private Zone"
  value       = concat(alicloud_pvtz_zone.this.*.name, [""])[0]
}
