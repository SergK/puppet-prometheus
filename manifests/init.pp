# Class: prometheus
# ===========================
#
class prometheus (
  $push_gateway_enabled = $::prometheus::params::push_gateway_enabled

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
