resource "alicloud_pvtz_zone_record" "record_cname" {
  zone_id         = "${var.domain_id[0]}"
  resource_record = "${var.name["cname"]}"
  type            = "${var.type["cname"]}"
  ttl             = "${var.ttl}"
  value           = "www.aliyun.com"
}

// add record "A" with list
resource "alicloud_pvtz_zone_record" "record_a" {
  count           = "${var.a_count}"
  zone_id         = "${var.domain_id[0]}"
  resource_record = "${var.name["a"]}"
  type            = "${var.type["a"]}"
  ttl             = "${var.ttl}"
  value           = "${lookup(var.a_value, count.index)}"
}


// add record "AAAA" 
resource "alicloud_pvtz_zone_record" "record_aaaa" {
  zone_id         = "${var.domain_id[0]}"
  resource_record = "${var.name["aaaa"]}"
  type            = "${var.type["aaaa"]}"
  ttl             = "${var.ttl}"
  value           = "2001::1"
}

// add record "MX" 
resource "alicloud_pvtz_zone_record" "record_mx" {
  zone_id         = "${var.domain_id[0]}"
  resource_record = "${var.name["mx"]}"
  type            = "${var.type["mx"]}"
  ttl             = "${var.ttl}"
  priority        = "${var.mx_priority}"
  value           = "mx.aliyun.com"
}