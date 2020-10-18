variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "<%= ENV['GOOGLE_PROJECT'] %>"
}

variable "region" {
  description = "The region to host the cluster in"
  default = "<%= ENV['GOOGLE_REGION'] %>"
}
