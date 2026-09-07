# Microsoft Entra Group with Terraform/OpenTofu - Training Examples

This directory contains progressive examples used with the **terraform-az-fk-entra-group** module.
The examples are designed as incremental building blocks for identity-first Azure architectures.

These examples are part of the [FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/) and are meant to be applied independently for learning and experimentation.

---

## Example Overview

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Security Group** | Microsoft Entra security group, current principal owner |
| 02 | **Group with Members** | Microsoft Entra security group, explicit members, database admin composition |

---

## How to Use

Each example directory contains:

- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the goal of the example
- A `terraform.tfvars.example` file with placeholder values

To run an example:

```bash
cd examples/01_security_group
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

The recommended learning path is sequential:

```text
01 -> 02
```

---

## Design Principles

- One example = one identity goal
- Entra group lifecycle is isolated from Azure resource role assignments
- Azure RBAC is composed separately with `terraform-az-fk-rbac`
- Service modules consume group object IDs through explicit inputs
- Examples avoid hidden dependencies between directories

---

## Related Resources

- [FoggyKitchen Entra Group Module](../)
- [FoggyKitchen Azure RBAC Module](https://github.com/foggykitchen/terraform-az-fk-rbac)
- [FoggyKitchen Azure PostgreSQL Module](https://github.com/foggykitchen/terraform-az-fk-pg)
- [FoggyKitchen Azure SQL Module](https://github.com/foggykitchen/terraform-az-fk-sql)

---

## License

Licensed under the Universal Permissive License (UPL), Version 1.0.
See [LICENSE](../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
