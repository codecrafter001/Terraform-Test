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
terraform import aws_route_table.rtb_022e5cf32607ba4b7_d650e310 rtb-022e5cf32607ba4b7
terraform import aws_subnet.subnet_007975abb691f5086_a87b6c1f subnet-007975abb691f5086
terraform import aws_subnet.subnet_028f09f11e9f2356c_9df00f99 subnet-028f09f11e9f2356c
terraform import aws_subnet.subnet_06fe4b2e3d8ab30e8_0aa66a6d subnet-06fe4b2e3d8ab30e8
terraform import aws_subnet.subnet_08c8642d18a050083_d60657db subnet-08c8642d18a050083
terraform import aws_subnet.subnet_0c331a35bac8b36dc_2bf45688 subnet-0c331a35bac8b36dc
terraform import aws_subnet.subnet_0de9a1e1553e1806a_cbf1fdb2 subnet-0de9a1e1553e1806a
```
