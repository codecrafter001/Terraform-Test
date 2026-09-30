# TerraAgent Import Plan

The same imports as `terraform/imports.tf` (the preferred path - see README), as
`terraform import` CLI commands for Terraform versions without import-block support.
Grouped into dependency-safe migration waves by the Adoption Planning Agent. Run these
from inside the `terraform/` directory, after `terraform init` and after deleting
`imports.tf`, completing each wave before starting the next.
See `migration_checklist.md` for the full adoption procedure. Resources classified
"skip" (AWS-managed) or "use_data_source" (referenced, not owned) are intentionally
excluded - there's no `resource` block for either to import into.

```bash
# Wave 1 - risk: medium
#   - 7 untagged resource(s)
terraform import aws_route_table.rtb_003b648347930edfc_24811887 rtb-003b648347930edfc
terraform import aws_subnet.subnet_02dadc23105f456c7_e02172d9 subnet-02dadc23105f456c7
terraform import aws_subnet.subnet_05903c67b2d9cf30e_d79e046f subnet-05903c67b2d9cf30e
terraform import aws_subnet.subnet_09159df420049bc3a_266ccf66 subnet-09159df420049bc3a
terraform import aws_subnet.subnet_0b6636ac6bf13e7e5_914d31f6 subnet-0b6636ac6bf13e7e5
terraform import aws_subnet.subnet_0c3a8f6c4789c2fc0_2d098f5f subnet-0c3a8f6c4789c2fc0
terraform import aws_subnet.subnet_0cc33aa9e58ca5daa_0fd504a3 subnet-0cc33aa9e58ca5daa
```
