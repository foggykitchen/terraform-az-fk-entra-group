output "id" {
  description = "Microsoft Entra group resource ID."
  value       = azuread_group.this.id
}

output "object_id" {
  description = "Microsoft Entra group object ID."
  value       = azuread_group.this.object_id
}

output "display_name" {
  description = "Microsoft Entra group display name."
  value       = azuread_group.this.display_name
}

output "tenant_id" {
  description = "Microsoft Entra tenant ID used by the AzureAD provider."
  value       = data.azuread_client_config.current.tenant_id
}

output "owner_object_ids" {
  description = "Effective owner object IDs configured on the group."
  value       = local.effective_owners
}

output "member_object_ids" {
  description = "Effective member object IDs configured on the group."
  value       = local.effective_members
}
