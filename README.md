# Infrastructure Overview

- **Target Region:** `us-east-1`
- **Total Discovered Resources:** 25
- **Main Services:**
  - **Networking & Content Delivery:** Amazon VPC (1 VPC, 6 Subnets, 1

## Pending Human Approval

**A human APPROVED proceeding despite 11 finding(s) below (highest risk tier: `destructive`) on 2026-09-30T11:18:09.725687.**

- **[destructive]** `aws_vpc.vpc_041d35e78174e8bf4_75fd5433` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_subnet.subnet_0cc33aa9e58ca5daa_0fd504a3` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_subnet.subnet_09159df420049bc3a_266ccf66` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_subnet.subnet_0c3a8f6c4789c2fc0_2d098f5f` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_subnet.subnet_02dadc23105f456c7_e02172d9` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_subnet.subnet_05903c67b2d9cf30e_d79e046f` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_subnet.subnet_0b6636ac6bf13e7e5_914d31f6` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_route_table.rtb_003b648347930edfc_24811887` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_security_group.default_937736ee` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_security_group.terraagent_ubuntu_ec2_sg_979694b3` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
- **[destructive]** `aws_instance.terraagent_ubuntu_ec2_713161c0` (drift_reconciliation live-attribute-drift, HIGH): This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

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
