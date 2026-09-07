variable "display_name" {
  description = "Microsoft Entra security group display name."
  type        = string
  default     = "fk-entra-group-02"
}

variable "description" {
  description = "Microsoft Entra security group description."
  type        = string
  default     = "FoggyKitchen example security group with explicit members."
}

variable "user_principal_name_suffix" {
  description = "Verified Microsoft Entra domain suffix for example users."
  type        = string
}

variable "member_password" {
  description = "Initial Microsoft Entra user password used by all example users."
  type        = string
  sensitive   = true
}
