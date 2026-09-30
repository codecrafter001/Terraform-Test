# TerraAgent Drift Reconciliation Report

Diffs each adopted resource's live AWS attributes against what was actually written into the generated Terraform - see `reports/drift_results.json` for the raw data.

- **Resources checked against live AWS:** 11
- **No longer exist in AWS:** 11
- **Destructive-equivalent finding(s):** 11
- **Behavior-changing finding(s):** 0
- **Informational (tag) difference(s):** 0

Destructive-equivalent and behavior-changing findings below were escalated to "Pending Human Approval" in `README.md` and never auto-repaired - this agent only reports drift, it never modifies generated HCL.

## `aws_vpc.vpc_041d35e78174e8bf4_75fd5433` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_subnet.subnet_0cc33aa9e58ca5daa_0fd504a3` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_subnet.subnet_09159df420049bc3a_266ccf66` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_subnet.subnet_0c3a8f6c4789c2fc0_2d098f5f` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_subnet.subnet_02dadc23105f456c7_e02172d9` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_subnet.subnet_05903c67b2d9cf30e_d79e046f` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_subnet.subnet_0b6636ac6bf13e7e5_914d31f6` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_route_table.rtb_003b648347930edfc_24811887` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_security_group.default_937736ee` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_security_group.terraagent_ubuntu_ec2_sg_979694b3` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.

## `aws_instance.terraagent_ubuntu_ec2_713161c0` - (entire resource)
- **Tier:** destructive_equivalent
- **Generated:** `present in generated HCL`
- **Live:** `no longer exists in AWS`
- This resource was discovered earlier in this scan but no longer exists in AWS - importing it would fail outright.
