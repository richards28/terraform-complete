module "test" {
    source = "../template"
    ai = var.amiii
    ky = var.keys
    ty = var.typo
  
}

module "dev" {
    source = "github.com/richards28/terraform/day9-module-template/"
    ami = var.amiii
    type = var.typo
    key = var.keys

  
}