##############################################
### Standard variables for all AWS modules ###
##############################################

variable "name_prefix" {
  description = "Standard `name_prefix` module input."
  type        = string
}
variable "environment" {
  description = "Standard `environment` module input."
  type = object({
    vpc_id          = string
    aws_region      = string
    public_subnets  = list(string)
    private_subnets = list(string)
  })
}
variable "resource_tags" {
  description = "Standard `resource_tags` module input."
  type        = map(string)
}

########################################
### Custom variables for this module ###
########################################

variable "container_command" {
  description = "The command to run on the Airflow container."
  type        = string
}
variable "container_image" {
  description = "Optional. Overrides the docker image used for Airflow execution."
  type        = string
  default     = "airflow"
}
variable "container_num_cores" {
  description = "Optional. The number of CPU cores."
  default     = 2
}
variable "container_ram_gb" {
  description = "Optional. The amount of RAM to use, in GB."
  default     = 4
}
variable "environment_vars" {
  description = "A map of environment variables to pass to the Airflow image."
  type        = map(string)
  default     = {}
}
variable "environment_secrets" {
  description = <<EOF
A map of environment variable secrets to pass to the airflow image. Each secret value should be either a
Secrets Manager URI or a local JSON or YAML file reference in the form `/path/to/file.yml:name_of_secret`.
EOF
  type        = map(string)
  default     = {}
}
variable "github_repo_ref" {
  description = "The git repo reference to clone onto the airflow server"
  type        = string
  default     = null
}
