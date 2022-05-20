# terraform-multi-environment-workspace
Module to easily create multiple environment workspaces inside TF Cloud.


## Usage

```hcl
module "gke" {
  source   = "git::https://github.com/GlueOps/terraform-multi-environment-workspace.git"
  for_each = ["dev","stage","prod"]

  tf_cloud_workspace_name       = "gcp-gke-${each.value}"
  organization                  = tfe_organization.primary_org.id
  terraform_version             = "1.1.9"
  working_directory             = "gke/tf"
  oauth_token_id                = local.vcs_settings.github_token_id
  tf_local_workspace            = each.value
  vcs_repo                      = "${local.vcs_settings.githhub_org_name}/${local.vcs_settings.vcs_repo}"
  vcs_branch                    = "feature/add-gke"
  workspace_ids_to_trigger_runs = [tfe_workspace.gcp-organization.id]
  slack_token                   = var.slack_token
}
```




## Inputs Required:

| Name | Description | Required |
| --- | ----------- | -------- |
| tf_cloud_workspace_name | prefix of the TFC workspace name | Yes |
| organization  | name of the TFC organization | Yes |
|  terraform_version | Specify the Terraform Version for the TFC workspace to be configured with | Yes |
|  working_directory | the directory inside the repository to find the working tf files | Yes |
|  oauth_token_id | The Token ID from when you connected Terraform Cloud to GitHub | Yes |
|  tf_local_workspace | This sets the environment to reference within your terraform code | Yes |
|  vcs_repo | the github repository | Yes |
|  vcs_branch | the branch of the repo in github | Yes |
|  workspace_ids_to_trigger_runs | Referenced other workspace ID's that should trigger running this one | Yes |
| slack_token  | Webhook token to send notifications to slack | Yes |

