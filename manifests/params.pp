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

}
