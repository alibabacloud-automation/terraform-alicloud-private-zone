variable "zone_id" {
  description = "Zone id what you want to attachment it with vpc list"
}

variable "vpc_id_list" {
  description = "vpc id list"
  type        = "list"
  default     = []
}

variable "vpc_id_list_count" {
  description = "vpc id list length"
}
