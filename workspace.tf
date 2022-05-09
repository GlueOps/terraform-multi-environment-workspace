resource "tfe_workspace" "producer" {
  name              = var.tf_cloud_workspace_name
  organization      = var.organization
  terraform_version = var.terraform_version
  working_directory = var.working_directory
  auto_apply        = var.auto_apply

  vcs_repo {
    identifier     = var.vcs_repo
    branch         = var.vcs_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_variable" "workspace" {
  key          = "workspace"
  value        = var.tf_local_workspace
  category     = "terraform"
  workspace_id = tfe_workspace.producer.id
}

resource "tfe_run_trigger" "trigger" {
  for_each      = toset(var.workspace_ids_to_trigger_runs)
  workspace_id  = tfe_workspace.producer.id
  sourceable_id = each.key
}

