output "this_name" {
  value = ["${flatten(alicloud_pvtz_zone.this.*.name)}"]
}

output "this_id" {
  value = "${alicloud_pvtz_zone.this.0.id}"
}
