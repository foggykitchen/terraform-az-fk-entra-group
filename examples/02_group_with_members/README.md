# Example 02 - Group with Members

This example creates a Microsoft Entra security group and adds explicit member object IDs.

The group object ID can be passed to service modules that accept Entra administrators or other group principals.

## Architecture

- Microsoft Entra security group
- Current provider principal as group owner
- Explicit user, group, or service principal members

## Usage

```bash
cd examples/02_group_with_members
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
```

Update `terraform.tfvars` with real Microsoft Entra object IDs before planning with members.
