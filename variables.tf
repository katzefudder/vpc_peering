variable "region" {}
variable "customer" {}

variable "internal-services" {
  default = {
    internal-services = {
      vpc_cidr_block = {
        1 = "10.255.0.0/16"
      }
      private = {
        "eu-central-1a" = "10.255.1.0/24"
        "eu-central-1b" = "10.255.2.0/24"
        "eu-central-1c" = "10.255.3.0/24"
      }
      public = {
        "eu-central-1a" = "10.255.4.0/24"
        "eu-central-1b" = "10.255.5.0/24"
        "eu-central-1c" = "10.255.6.0/24"
      }
    }
  }
}

variable "customers" {
  default = {
    customer_a = {
      vpc_cidr_block = {
        1 = "10.1.0.0/16"
      }
      private = {
        "eu-central-1a" = "10.1.1.0/24"
        "eu-central-1b" = "10.1.2.0/24"
        "eu-central-1c" = "10.1.3.0/24"
      }
      public = {
        "eu-central-1a" = "10.1.4.0/24"
        "eu-central-1b" = "10.1.5.0/24"
        "eu-central-1c" = "10.1.6.0/24"
      }
    }
    customer_b = {
      vpc_cidr_block = {
        1 = "10.2.0.0/20"
      }
      private = {
        "eu-central-1a" = "10.2.0.0/24"
        "eu-central-1b" = "10.2.1.0/24"
        "eu-central-1c" = "10.2.2.0/24"
      }
      public = {
        "eu-central-1a" = "10.2.3.0/24"
        "eu-central-1b" = "10.2.4.0/24"
        "eu-central-1c" = "10.2.5.0/24"
      }
    }
    customer_c = {
      vpc_cidr_block = {
        1 = "10.2.16.0/20"
      }
      private = {
        "eu-central-1a" = "10.2.16.0/24"
        "eu-central-1b" = "10.2.17.0/24"
        "eu-central-1c" = "10.2.18.0/24"
      }
      public = {
        "eu-central-1a" = "10.2.19.0/24"
        "eu-central-1b" = "10.2.20.0/24"
        "eu-central-1c" = "10.2.21.0/24"
      }
    }
    customer_d = {
      vpc_cidr_block = {
        1 = "10.2.16.0/20"
      }
      private = {
        "eu-central-1a" = "10.2.16.0/24"
        "eu-central-1b" = "10.2.17.0/24"
        "eu-central-1c" = "10.2.18.0/24"
      }
      public = {
        "eu-central-1a" = "10.2.19.0/24"
        "eu-central-1b" = "10.2.20.0/24"
        "eu-central-1c" = "10.2.21.0/24"
      }
    }
  }
}