output "this_records" {
  value = "${formatlist("%v   %64v : %10v   %5v   %v", alicloud_pvtz_zone_record.this.*.id, alicloud_pvtz_zone_record.this.*.resource_record, alicloud_pvtz_zone_record.this.*.type,alicloud_pvtz_zone_record.this.*.ttl, alicloud_pvtz_zone_record.this.*.value)}"
}
