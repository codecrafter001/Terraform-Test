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
#   - 4 untagged resource(s)
terraform import aws_route_table.rtb_0829fc54bd9bd1d4b_d5429212 rtb-0829fc54bd9bd1d4b
terraform import aws_subnet.subnet_060b820ee16766ef3_e2b0637e subnet-060b820ee16766ef3
terraform import aws_subnet.subnet_064d34d3dc729b467_618414fb subnet-064d34d3dc729b467
terraform import aws_subnet.subnet_0e3e44c16f23334f9_6d97c50f subnet-0e3e44c16f23334f9
```
