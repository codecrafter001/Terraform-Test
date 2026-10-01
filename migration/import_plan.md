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

```
