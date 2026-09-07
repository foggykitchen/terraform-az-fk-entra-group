data "azuread_client_config" "current" {}

locals {
  effective_owners = setunion(
    var.owners,
    var.include_current_principal_as_owner ? toset([data.azuread_client_config.current.object_id]) : toset([])
  )

  effective_members = setunion(
    var.members,
    var.include_current_principal_as_member ? toset([data.azuread_client_config.current.object_id]) : toset([])
  )
}

resource "azuread_group" "this" {
  display_name            = var.display_name
  description             = var.description
  owners                  = local.effective_owners
  members                 = local.effective_members
  prevent_duplicate_names = var.prevent_duplicate_names
  security_enabled        = true
}
