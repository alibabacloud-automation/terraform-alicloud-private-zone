resource "alicloud_pvtz_zone_attachment" "attachment" {
  zone_id = var.zone_id
  vpc_ids = var.vpc_id_list
  count   = var.need_attachment ? 1 : 0
}

