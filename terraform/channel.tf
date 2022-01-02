resource "mackerel_channel" "slack" {
  name = "slack"

  slack {
    // 適当なURL
    url                 = "https://hooks.slack.com/services/ABCD/12345"
    enabled_graph_image = true
    mentions = {
      critical = "@here"
    }
    events = ["alert"]
  }
}
