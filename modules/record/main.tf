resource "alicloud_pvtz_zone_record" "this" {
    zone_id                 = "${var.zone_id}"
    resource_record         = "${lookup(var.record_list[count.index], "name")}"
    type                    = "${lookup(var.record_list[count.index], "type")}"
    ttl                     = "${lookup(var.record_list[count.index], "ttl")}"
    value                   = "${lookup(var.record_list[count.index], "value")}"
    priority                = "${lookup(var.record_list[count.index], "priority")}"
    count                   = "${length(var.record_list)}"
}