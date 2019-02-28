resource "alicloud_pvtz_zone_attachment" "attachment" {
  zone_id = "${var.zone_id}"
  vpc_ids = ["${var.vpc_id_list}"]
  count   = "${var.vpc_id_list_count}"
}
