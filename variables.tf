variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

################################
# pvtz_zone
################################
variable "create" {
  description = "Whether to create private zone."
  type        = bool
  default     = true
}

variable "existing_zone_name" {
  description = "The name of an existing private zone. If set, 'create' will be ignored."
  type        = string
  default     = ""
}

variable "zone_name" {
  description = "The name of zone. If not set, a default name with prefix 'terraform-zone-' will be returned. "
  type        = string
  default     = ""
}

variable "remark" {
  description = "The remark of the Private Zone"
  type        = string
  default     = ""
}

################################
# pvtz_zone_record
################################
variable "add_records" {
  description = "Whether to add records to Private Zone."
  type        = bool
  default     = true
}


variable "records" {
  description = "PVT Zone record list.Each item can contains keys: 'rr'(The resource record of the Private Zone Record. 'name' has been deprecated from 1.3.0, and use 'rr' instead.),'type'(The type of the Private Zone Record. Valid values: A, CNAME, TXT, MX, PTR. Default to A.),'value'(The value of the Private Zone Record),'priority'(The priority of the Private Zone Record. At present, only can 'MX' record support it. Valid values: [1-50]. Default to 1.),'ttl'(The ttl of the Private Zone Record. Default to 60.)."
  type        = list(map(string))
  default     = []
}

################################
# pvtz_zone_attachment
################################
variable "vpc_ids" {
  description = "The id List of the VPC with the same region, for example:['vpc-1','vpc-2']."
  type        = list(string)
  default     = []
}

variable "attach_vpc" {
  description = "Whether to associate VPC to Private zone."
  type        = bool
  default     = true
}

variable "user_client_ip" {
  description = "The user custom IP address"
  type        = string
  default     = ""
}

variable "lang" {
  description = "The language of code. Valid values: 'zh', 'en', 'jp."
  type        = string
  default     = ""
}

# Deprecated variables
variable "record_list" {
  description = "(Deprecated) It has been deprecated from 1.2.0, and use 'records' instead."
  type        = list(map(string))
  default     = []
}

variable "vpc_id_list" {
  description = "(Deprecated) It has been deprecated from 1.2.0, and use 'vpc_ids' instead."
  type        = list(string)
  default     = []
}


