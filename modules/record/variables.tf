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

variable "zone_id" {
  description = "PVT Zone record parrent zone id"
}

