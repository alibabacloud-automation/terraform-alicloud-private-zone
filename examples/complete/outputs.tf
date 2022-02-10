output "this_private_zone_records" {
  description = "List of the Private Zone records"
  value       = module.pvtz_zone_record.this_private_zone_records
}
output "this_private_zone_name" {
  description = "The name of Private Zone"
  value       = module.pvtz_zone.this_private_zone_name
}