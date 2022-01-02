resource "mackerel_role" "load_balancer" {
  service = mackerel_service.service.name
  name    = "alb"
  memo    = "study resource"
}

resource "mackerel_role" "web" {
  service = mackerel_service.service.name
  name    = "web"
  memo    = "study resource"
}

resource "mackerel_role" "api" {
  service = mackerel_service.service.name
  name    = "api"
  memo    = "study resource"
}

resource "mackerel_role" "database" {
  service = mackerel_service.service.name
  name    = "database"
  memo    = "study resource"
}
