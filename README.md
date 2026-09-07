# terraform-az-fk-entra-group

This repository contains a reusable Terraform / OpenTofu module and progressive examples for deploying **Microsoft Entra security groups**.

It is part of the [FoggyKitchen.com training ecosystem](https://foggykitchen.com) and is designed as a small, composable identity layer for Azure examples that need group-based access control.

Support expectations are documented in [SUPPORT.md](SUPPORT.md).

---

## Purpose

The goal of this module is to provide a clear, educational, and architecture-aware reference implementation for Microsoft Entra groups:

- Focused on Entra security groups
- Explicit owners and members
- Designed to compose with:
  - `terraform-az-fk-rbac` for Azure resource role assignments
  - database modules that accept Entra administrator principals
  - application modules that need group object IDs

This is not a full IAM framework or policy engine.
It is a learning-first, building-block module.

---

## What the module does

The module creates:

- One Microsoft Entra security group
- Optional owner assignments
- Optional member assignments

The module intentionally does not create:

- Azure role assignments
- Azure resources such as Resource Groups, databases, Key Vaults, or VNets
- Users
- Service principals
- Applications
- Dynamic membership rules
- Privileged Identity Management settings

Each of those concerns belongs in its own dedicated module or workflow layer.

---

## Repository Structure

```text
terraform-az-fk-entra-group/
├── examples/
│   ├── 01_security_group/
│   ├── 02_group_with_members/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
├── SUPPORT.md
└── README.md
```

---

## Example Usage

```hcl
module "postgresql_admin_group" {
  source = "git::https://github.com/foggykitchen/terraform-az-fk-entra-group.git?ref=v0.1.0"

  display_name = "fk-postgresql-admins"

  members = [
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

The group object ID can be passed to modules that support Entra principals:

```hcl
entra_administrators = {
  admins = {
    principal_name = module.postgresql_admin_group.display_name
    object_id      = module.postgresql_admin_group.object_id
    principal_type = "Group"
  }
}
```

---

## Inputs

| Input | Description | Default |
|-------|-------------|---------|
| `display_name` | Microsoft Entra security group display name | n/a |
| `description` | Optional Microsoft Entra security group description | `null` |
| `owners` | Object IDs of principals that should own the group | `[]` |
| `members` | Object IDs of users, groups, or service principals that should be members of the group | `[]` |
| `include_current_principal_as_owner` | Whether to add the current AzureAD provider principal as a group owner | `true` |
| `include_current_principal_as_member` | Whether to add the current AzureAD provider principal as a group member | `false` |
| `prevent_duplicate_names` | Whether to fail when another group with the same display name already exists | `true` |
| `tags` | Reserved for consistency with FoggyKitchen module interfaces; Entra groups do not support Azure tags | `{}` |

---

## Outputs

| Output | Description |
|--------|-------------|
| `id` | Microsoft Entra group resource ID |
| `object_id` | Microsoft Entra group object ID |
| `display_name` | Microsoft Entra group display name |
| `tenant_id` | Microsoft Entra tenant ID used by the AzureAD provider |
| `owner_object_ids` | Effective owner object IDs configured on the group |
| `member_object_ids` | Effective member object IDs configured on the group |

---

## Design Philosophy

- Entra groups are principals, not Azure resource scopes
- Azure RBAC remains in `terraform-az-fk-rbac`
- Service modules should consume group IDs instead of creating groups internally
- Examples should compose group lifecycle explicitly where end-to-end labs need it
- Defaults keep the current provider principal as owner so Terraform can continue managing the group

---

## Related Modules & Training

- [terraform-az-fk-rbac](https://github.com/foggykitchen/terraform-az-fk-rbac)
- [terraform-az-fk-managed-identity](https://github.com/foggykitchen/terraform-az-fk-managed-identity)
- [terraform-az-fk-pg](https://github.com/foggykitchen/terraform-az-fk-pg)
- [terraform-az-fk-sql](https://github.com/foggykitchen/terraform-az-fk-sql)

---

## License

Licensed under the Universal Permissive License (UPL), Version 1.0.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
