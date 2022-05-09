variable "tf_cloud_workspace_name" {}
variable "organization" {}
variable "terraform_version" {}
variable "working_directory" {}
variable "oauth_token_id" {}
variable "tf_local_workspace" {}
variable "workspace_ids_to_trigger_runs" { default = [] }
variable "vcs_repo" {}
variable "vcs_branch" { default = "main" }
variable "auto_apply" { default = false }
variable "notification_triggers" { default = ["run:needs_attention"] }
variable "slack_token" { sensitive = true }

