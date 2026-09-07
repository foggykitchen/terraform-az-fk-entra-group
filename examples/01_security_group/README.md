# Example 01 - Security Group

This example creates a Microsoft Entra security group with the current AzureAD provider principal configured as the owner.

## Architecture

- Microsoft Entra security group
- Current provider principal as group owner

## Usage

```bash
cd examples/01_security_group
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
```

The identity running this example needs permission to create Microsoft Entra groups.
