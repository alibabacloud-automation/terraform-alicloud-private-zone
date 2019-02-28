variable "domain_name" {
  description = "PVT Zone domain name"
}

variable "record_list" {
  description = "PVT Zone record list"
  type        = "list"
}

variable "vpc_id_list" {
  description = "vpc id list, this list will attach to the zone"
  type        = "list"
}

variable "vpc_id_list_count" {
  description = "vpc id list length"
}
