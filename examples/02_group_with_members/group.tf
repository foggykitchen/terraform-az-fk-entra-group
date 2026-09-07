module "entra_group" {
  source = "../../"

  display_name = var.display_name
  description  = var.description
  members      = var.member_object_ids
}
