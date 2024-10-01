provider "Datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
resource "datadog_dashboard" "host_dash" {
  title       = "Host Dashboard"
  description = "A dashboard created using Terraform"
  layout_type = "ordered"
  widget {
    timeseries_definition {
      title = "CPU usage" # Title is empty in the JSON, adjust if needed

      request {
        formulas {
          formula = "query1"
        }

        queries {
          name        = "query1"
          data_source = "metrics"
          query       = "avg:system.cpu.user{host}" # Ensure correct escaping for the $host variable
        }

        response_format = "timeseries"
        display_type    = "line"

        style {
          palette    = "dog_classic"
          line_type  = "solid"
          line_width = "normal"
        }
      }
    }
  }
}
