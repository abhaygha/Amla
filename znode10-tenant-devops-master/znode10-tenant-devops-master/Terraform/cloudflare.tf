terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"  
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token1  
}

resource "cloudflare_record" "dns_records" {
  for_each = {
    "pagebuilder-etna-qa.amla.io"         = "48.214.245.96"
    "pagebuilder-knox-qa.amla.io"        = "48.214.245.104"

  }

  zone_id = var.cloudflare_zone_id1  
  name    = each.key
  type    = "A"
  content = each.value
  ttl     = 3600
  proxied = false
}

# Define variables
variable "cloudflare_api_token1" {
  description = "The API token for Cloudflare"
  type        = string
}

variable "cloudflare_zone_id1" {
  description = "The Zone ID for Cloudflare"
  type        = string
}
