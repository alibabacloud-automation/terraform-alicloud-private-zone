variable "zone_id" {
  description = "Zone id what you want to attachment it with vpc list"
}

variable "vpc_id_list" {
  description = "vpc id list"
  type        = "list"
  default     = []
}

variable "need_attachment" {
  description = "attach switch"
  default     = false
}
