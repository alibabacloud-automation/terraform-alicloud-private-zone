// add zone
resource "alicloud_pvtz_zone" "zone" {
  name        = "${var.name[0]}"
}