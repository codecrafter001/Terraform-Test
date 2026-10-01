# Infrastructure Overview

- **AWS Region**: `us-east-1`
- **Total Discovered Resources**: 16
- **Main Services**:
  - **Amazon Virtual Private Cloud (VPC)**: 1 VPC, 6 Subnets, 1 Internet Gateway, 1 Route Table
  - **Amazon EC2 Security**: 1 Security Group
  - **AWS Identity and Access Management (IAM)**: 6 IAM Roles (2 application task/execution roles, 4 AWS service-linked roles)

---

## Discovered Architecture Summary

The discovered environment in `us-east-1` comprises a foundational networking stack and related IAM identity configurations:

1. **Networking Core**:
   - **VPC**: ID `vpc-006ad49e146058669` forms the primary network container.
   - **Subnets**: Six distinct subnets (`subnet-0de9a1e1

## Pending Human Approval

No findings required escalation to human approval - nothing was left unfixed.

## Safe Import & Adoption Instructions

Follow these steps in order. `terraform/imports.tf` contains an `import {}` block
for every managed resource - keep it, or Terraform will try to create duplicate
resources instead of adopting your existing ones.

1. Run `terraform init` inside the `terraform/` directory (Terraform >= 1.5 or
   OpenTofu >= 1.6, which support import blocks).
2. Run `terraform plan`. Every managed resource should show as "will be imported",
   and the summary should read `N to import, 0 to add, 0 to change, 0 to destroy`.
   Any add/change/destroy means the generated configuration doesn't yet match the
   real resource exactly - review it before going further.
3. Only once the plan is clean should a human apply it, after review, through your
   normal pipeline (Atlantis, HCP Terraform, Spacelift, CI). Applying is what
   performs the imports. TerraAgent itself never runs `apply`, `destroy` or `import`.

Older Terraform without import-block support: delete `imports.tf` and run the
`terraform import` commands in `migration/import_plan.md` instead, in order.
