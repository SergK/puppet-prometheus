# == Class: prometheus::params
#
class prometheus::params {
  $config_dir                  = '/etc/prometheus'
  $file_sd_config_dir          = "${config_dir}/file_sd_configs"
  $jmx_agent_package_ensure    = 'latest'
  $jmx_agent_package_name      = 'prometheus-jmx-agent'
  $package_ensure              = 'latest'
  $package_name                = 'prometheus'
  $push_gateway_enabled        = true
  $push_gateway_package_ensure = 'latest'
  $push_gateway_package_name   = 'prometheus-pushgateway'
  $service_enable              = true
  $service_ensure              = 'running'
  $service_manage              = true
  $storage_path                = '/var/lib/prometheus'
  $global_config               = {
      'scrape_interval'     => '15s',
      'evaluation_interval' => '15s',
      'external_labels'     => { 'monitor'=>'master'},
  },
  $scrape_configs              = [ {
      'job_name'        => 'prometheus',
      'scrape_interval' => '10s',
      'scrape_timeout'  => '10s',
      'static_configs'  => [ {
        'targets' => [ 'localhost:9090' ],
        'labels'  => { 'alias'=> 'Prometheus'}
      } ]
  } ]

}
