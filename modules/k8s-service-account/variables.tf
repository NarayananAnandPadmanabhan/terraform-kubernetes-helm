# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These variables are expected to be passed in by the operator when calling this terraform module.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the service account to be created."
}

variable "namespace" {
  description = "The namespace where the service account is created."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

# Workaround terraform limitation where resource count can not include interpolated lists.
# See: https://github.com/hashicorp/terraform/issues/17421
variable "num_rbac_roles" {
  description = "Number of RBAC roles to bind. This should match the number of items in the list passed to rbac_roles."
  default     = 0
}

variable "rbac_roles" {
  description = "List of names of the RBAC roles that should be bound to the service account. If this list is non-empty, you must also pass in num_rbac_roles specifying the number of roles."
  type        = "list"
  default     = []
}

variable "labels" {
  description = "Map of string key default pairs that can be used to organize and categorize the service account. See the Kubernetes Reference for more info (https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)."
  type        = "map"
  default     = {}
}

variable "annotations" {
  description = "Map of string key default pairs that can be used to store arbitrary metadata on the service account. See the Kubernetes Reference for more info (https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/)."
  type        = "map"
  default     = {}
}

variable "automount_service_account_token" {
  description = "Whether or not to automatically mount the service account token into the container. This defaults to true."
  default     = true
}

variable "secrets_for_pulling_images" {
  description = "A list of references to secrets in the same namespace to use for pulling any images in pods that reference this Service Account."
  type        = "list"
  default     = []
}

variable "secrets_for_pods" {
  description = "A list of secrets allowed to be used by pods running using this Service Account."
  type        = "list"
  default     = []
}
