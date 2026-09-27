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
# Wave 1 - risk: high
#   - contains high-blast-radius resource type(s): aws_iam_role
#   - 1 resource(s) linked by advisory/low-confidence dependency
#   - 7 untagged resource(s)
terraform import aws_iam_role.aws_elasticbeanstalk_ec2_role_c4548318 aws-elasticbeanstalk-ec2-role
terraform import aws_s3_bucket.elasticbeanstalk_ap_south_1_314900493735_e601428d elasticbeanstalk-ap-south-1-314900493735
terraform import aws_route_table.rtb_0e1ce943b1ad77e78_e2f8527a rtb-0e1ce943b1ad77e78
terraform import aws_security_group.aikart_email_agent_sg_a2c49eff sg-01d377db9843deb12
terraform import aws_subnet.subnet_045e107acc9b9dfff_3e9a745b subnet-045e107acc9b9dfff
terraform import aws_subnet.subnet_0a25b61c8743c54af_c84cc3d0 subnet-0a25b61c8743c54af
terraform import aws_subnet.subnet_0eab8241c808097b4_46a4941e subnet-0eab8241c808097b4
```
