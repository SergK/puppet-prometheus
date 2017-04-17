# @api private
# This class handles prometheus packages. Avoid modifying private classes.
class prometheus::service inherits prometheus::params {

  if $prometheus::params::service_manage == true {
    service { 'prometheus':
      ensure     => $prometheus::params::service_ensure,
      enable     => $prometheus::params::service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
