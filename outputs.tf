output "this_domain_name" {
  value = "${module.domain.this_name}"
}

output "this_records" {
  value = "${module.records.this_records}"
}
