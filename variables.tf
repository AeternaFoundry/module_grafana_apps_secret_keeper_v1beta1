variable "apps_secret_keeper_v1beta1s" {
  description = <<EOT
Map of apps_secret_keeper_v1beta1s, attributes below
Optional:
    - metadata (block):
        - folder_uid (optional)
        - uid (required)
    - options (block):
        - manager_identity (optional)
        - overwrite (optional)
    - spec (block):
        - aws (optional, block):
            - assume_role (optional, block):
                - assume_role_arn (optional)
                - external_id (optional)
            - region (required)
        - description (optional)
EOT

  type = map(object({
    metadata = optional(list(object({
      folder_uid = optional(string)
      uid        = string
    })))
    options = optional(list(object({
      manager_identity = optional(string)
      overwrite        = optional(bool)
    })))
    spec = optional(list(object({
      aws = optional(list(object({
        assume_role = optional(list(object({
          assume_role_arn = optional(string)
          external_id     = optional(string)
        })))
        region = string
      })))
      description = optional(string)
    })))
  }))
}

