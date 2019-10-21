variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "domain_name" {
  description = "PVT Zone domain name"
}

variable "record_list" {
  description = "PVT Zone record list"
  type        = list(object({
    name     = string
    type     = string
    ttl      = number
    value    = string
    priority = number
  }))
}

variable "vpc_id_list" {
  description = "vpc id list, this list will attach to the zone"
  type        = list(string)
}

variable "need_attachment" {
  description = "attach switch"
  default     = false
}

