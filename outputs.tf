output "domain_id" {
  value = "${module.domain.id}"
}

output "record_cname" {
	value = "${module.record.record_cname}"
}

output "record_a" {
	value = "${module.record.record_a}"
}

output "record_aaaa" {
	value = "${module.record.record_aaaa}"
}

output "record_mx" {
	value = "${module.record.record_mx}"
}
