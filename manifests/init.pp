# Class: prometheus
# ===========================
#
class prometheus (
  $global_config        = $::prometheus::params::global_config,
  $push_gateway_enabled = $::prometheus::params::push_gateway_enabled,
  $scrape_configs       = $::prometheus::params::scrape_configs,
) inherits prometheus::params {

  contain prometheus::install
  contain prometheus::config
  contain prometheus::service
  Class['::prometheus::install']
  -> Class['::prometheus::config']
  ~> Class['::prometheus::service']

  # install and configure push_gateway as well
  if $push_gateway_enabled == true {
    include ::prometheus::push_gateway
    # let's reload service since we add push_gateway target
    Class['::prometheus::push_gateway']
    ~> Class['::prometheus::service']
  }

}
