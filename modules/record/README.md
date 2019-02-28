# record

Creates PVT Zone Domain. Accept list.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| record_list | Record list,  single element is map, need incloud name/ttl/type/value | list | - | yes |
| zone_id | Record`s zone`s id | string | "" | yes |


## Outputs

| Name | Description |
|------|-------------|
| this_records | Record information list |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
