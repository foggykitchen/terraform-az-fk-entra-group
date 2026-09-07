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

output "member_object_ids" {
  description = "Effective member object IDs configured on the group."
  value       = module.entra_group.member_object_ids
}
