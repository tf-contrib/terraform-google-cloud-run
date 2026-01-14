terraform {
  required_version = ">= 1.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 7.17"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "< 7.16"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-cloud-run/v0.9.1"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-cloud-run/v0.9.1"
  }
}
