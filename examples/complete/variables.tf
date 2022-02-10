################################
# pvtz_zone
################################
variable "remark" {
  description = "The remark of the Private Zone"
  type        = string
  default     = "pvtz"
}

################################
# pvtz_zone_record
################################
variable "records" {
  description = "PVT Zone record list.Each item can contains keys: 'rr'(The resource record of the Private Zone Record. 'name' has been deprecated from 1.3.0, and use 'rr' instead.),'type'(The type of the Private Zone Record. Valid values: A, CNAME, TXT, MX, PTR. Default to A.),'value'(The value of the Private Zone Record),'priority'(The priority of the Private Zone Record. At present, only can 'MX' record support it. Valid values: [1-50]. Default to 1.),'ttl'(The ttl of the Private Zone Record. Default to 60.)."
  type        = list(map(string))
  default = [
    {
      rr       = "www"
      type     = "A"
      ttl      = 60
      value    = "223.5.5.5"
      priority = 1
    }
  ]
}