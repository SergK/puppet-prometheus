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
    # we don't need notify prometheus service since file service discovery
    # will do it on his own: https://prometheus.io/docs/operating/configuration/#%3Cfile_sd_config%3E
    # > Changes to all defined files are detected via disk watches and applied
    # > immediately
    include ::prometheus::push_gateway
  }

}
