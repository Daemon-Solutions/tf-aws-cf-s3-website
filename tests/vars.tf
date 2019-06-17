variable "website_tags" {
  type = map(string)

  default = {
    "environment" = "prod"
    "purpose"     = "Website for a domain"
  }
}

variable "website_redirect_tags" {
  type = map(string)

  default = {
    "environment" = "prod"
    "purpose"     = "Redirection of web traffic to another website"
  }
}
