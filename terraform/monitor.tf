resource "mackerel_monitor" "cpu" {
  name                  = "cpu %"
  memo                  = "CPU使用率"
  is_mute               = false
  notification_interval = 10

  host_metric {
    metric   = "cpu%"
    operator = ">"
    warning  = 65
    critical = 90
    duration = 3
  }
}

resource "mackerel_monitor" "filesystem" {
  name                  = "filesystem %"
  memo                  = "ファイルシステム容量の監視"
  is_mute               = false
  notification_interval = 10

  host_metric {
    metric   = "filesystem%"
    operator = ">"
    warning  = 80
    critical = 90
    duration = 3
  }
}

resource "mackerel_monitor" "memory" {
  name                  = "memory %"
  memo                  = "メモリ容量の監視"
  is_mute               = false
  notification_interval = 10

  host_metric {
    metric   = "memory%"
    operator = ">"
    warning  = 65
    critical = 90
    duration = 3
  }
}

resource "mackerel_monitor" "external" {
  name                  = "Study External Monitoring"
  notification_interval = 10

  external {
    method                            = "GET"
    url                               = "https://google.com"
    service                           = mackerel_service.service.name
    response_time_critical            = 10000
    response_time_warning             = 1500
    response_time_duration            = 3
    headers                           = { Cache-Control = "no-cache" }
    certification_expiration_warning  = 20
    certification_expiration_critical = 10
  }
}

resource "mackerel_monitor" "cloudfront_5xx_rate" {
  name                  = "CloudFront 5xx rate"
  memo                  = "CloudFront 5xx レート"
  is_mute               = false
  notification_interval = 10

  host_metric {
    metric   = "custom.cloudfront.error_rate.5xx_error_rate"
    operator = ">"
    warning  = 0
    critical = 10
    duration = 1
  }
}

resource "mackerel_monitor" "alb_500_count" {
  name                  = "ALB 5xx count"
  memo                  = "ALB 5xx カウント"
  is_mute               = false
  notification_interval = 10

  host_metric {
    metric   = "custom.alb.httpcode_count.alb_5xx"
    operator = ">"
    warning  = 0
    critical = 1
    duration = 10
  }
}

resource "mackerel_monitor" "alb_healthy_check_count" {
  name                  = "ALB Healthy Check Count"
  memo                  = "ALB ホストヘルスチェックカウント"
  is_mute               = false
  notification_interval = 10

  host_metric {
    // ターゲットグループ名が入る
    metric   = "custom.alb.host_count.TARGET_GROUP_NAME.healthy"
    operator = ">"
    warning  = 0
    critical = 1
    duration = 10
  }
}

// TODO: API・DBの監視ルール
// TODO: ログ監視項目追加