output "group_id" {
  description = "Microsoft Entra group resource ID."
  value       = module.entra_group.id
}

output "group_object_id" {
  description = "Microsoft Entra group object ID."
  value       = module.entra_group.object_id
}

output "group_display_name" {
  description = "Microsoft Entra group display name."
  value       = module.entra_group.display_name
}

output "tenant_id" {
  description = "Microsoft Entra tenant ID used by the AzureAD provider."
  value       = module.entra_group.tenant_id
}
