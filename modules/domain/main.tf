resource "alicloud_pvtz_zone" "this" {
  name  = "${element(var.domain_list, count.index)}"
  count = "${length(var.domain_list) > var.domain_count ? var.domain_count : length(var.domain_list)}"
}
