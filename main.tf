resource "grafana_apps_secret_keeper_v1beta1" "apps_secret_keeper_v1beta1s" {
  for_each = var.apps_secret_keeper_v1beta1s


  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {
      folder_uid = metadata.value.folder_uid
      uid        = metadata.value.uid
    }
  }

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      manager_identity = options.value.manager_identity
      overwrite        = options.value.overwrite
    }
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {
      dynamic "aws" {
        for_each = spec.value.aws != null ? spec.value.aws : []
        content {
          dynamic "assume_role" {
            for_each = aws.value.assume_role != null ? aws.value.assume_role : []
            content {
              assume_role_arn = assume_role.value.assume_role_arn
              external_id     = assume_role.value.external_id
            }
          }
          region = aws.value.region
        }
      }
      description = spec.value.description
    }
  }
}

