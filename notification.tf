
resource "tfe_notification_configuration" "slack" {
  name             = "needs_attention"
  enabled          = true
  destination_type = "slack"
  url              = "https://hooks.slack.com/services/${var.slack_token}"
  triggers         = var.notification_triggers
  workspace_id     = tfe_workspace.producer.id
}
