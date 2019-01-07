output "id" {
  value = "${alicloud_pvtz_zone.zone.*.id}"
}