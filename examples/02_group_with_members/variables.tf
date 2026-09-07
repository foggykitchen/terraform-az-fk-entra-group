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

variable "member_object_ids" {
  description = "Object IDs of users, groups, or service principals to add as members."
  type        = set(string)
  default     = []
}
