# == Class: prometheus::push_gateway
#
class prometheus::push_gateway (
  $package_ensure = $prometheus::params::push_gateway_package_ensure,
  $package_name   = $prometheus::params::push_gateway_package_name,
  $service_enable = true,
  $service_ensure = 'running',
  $service_manage = true,
) inherits prometheus::params {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  package { $package_name:
    ensure => $package_ensure,
  }

  if $service_manage == true {
    service { 'pushgateway':
      ensure     => $service_ensure,
      enable     => $service_enable,
      hasstatus  => true,
      hasrestart => true,
      require    => Package[$package_name],
    }
  }
}
