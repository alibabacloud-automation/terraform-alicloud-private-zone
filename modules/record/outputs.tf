output "record_cname" {
	value 					= {
		"id"				= "${alicloud_pvtz_zone_record.record_cname.*.id}"
		"resource_record" 	= "${alicloud_pvtz_zone_record.record_cname.0.resource_record}"
		"type"				= "${alicloud_pvtz_zone_record.record_cname.0.type}"
		"ttl"				= "${alicloud_pvtz_zone_record.record_cname.0.ttl}"
		"value"				= "${alicloud_pvtz_zone_record.record_cname.*.value}"
	}
}

output "record_a" {
	value 					= {
		"id"				= "${alicloud_pvtz_zone_record.record_a.*.id}"
		"resource_record" 	= "${alicloud_pvtz_zone_record.record_a.0.resource_record}"
		"type"				= "${alicloud_pvtz_zone_record.record_a.0.type}"
		"ttl"				= "${alicloud_pvtz_zone_record.record_a.0.ttl}"
		"value"				= "${alicloud_pvtz_zone_record.record_a.*.value}"
	}
}

output "record_aaaa" {
	value 					= {
		"id"				= "${alicloud_pvtz_zone_record.record_aaaa.*.id}"
		"resource_record" 	= "${alicloud_pvtz_zone_record.record_aaaa.0.resource_record}"
		"type"				= "${alicloud_pvtz_zone_record.record_aaaa.0.type}"
		"ttl"				= "${alicloud_pvtz_zone_record.record_aaaa.0.ttl}"
		"value"				= "${alicloud_pvtz_zone_record.record_aaaa.*.value}"
	}
}

output "record_mx" {
	value 					= {
		"id"				= "${alicloud_pvtz_zone_record.record_mx.*.id}"
		"resource_record" 	= "${alicloud_pvtz_zone_record.record_mx.0.resource_record}"
		"type"				= "${alicloud_pvtz_zone_record.record_mx.0.type}"
		"ttl"				= "${alicloud_pvtz_zone_record.record_mx.0.ttl}"
		"value"				= "${alicloud_pvtz_zone_record.record_mx.*.value}"
	}
}