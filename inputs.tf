variable "display_name" {
  description = "Microsoft Entra security group display name."
  type        = string

  validation {
    condition     = length(trimspace(var.display_name)) > 0
    error_message = "display_name must not be empty."
  }
}

variable "description" {
  description = "Optional Microsoft Entra security group description."
  type        = string
  default     = null
}

variable "owners" {
  description = "Object IDs of principals that should own the group."
  type        = set(string)
  default     = []
}

variable "members" {
  description = "Object IDs of users, groups, or service principals that should be members of the group."
  type        = set(string)
  default     = []
}

variable "include_current_principal_as_owner" {
  description = "Whether to add the current AzureAD provider principal as a group owner."
  type        = bool
  default     = true
}

variable "include_current_principal_as_member" {
  description = "Whether to add the current AzureAD provider principal as a group member."
  type        = bool
  default     = false
}

variable "prevent_duplicate_names" {
  description = "Whether to fail when another group with the same display name already exists."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Reserved for consistency with FoggyKitchen module interfaces. Microsoft Entra groups do not support Azure resource tags."
  type        = map(string)
  default     = {}
}
