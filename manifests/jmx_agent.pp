# == Class: jmx_agent
#
class prometheus::jmx_agent (
  $package_ensure = $::prometheus::params::jmx_agent_package_ensure,
  $package_name   = $::prometheus::params::jmx_agent_package_name,

) inherits prometheus::params {

  package { $package_name:
      ensure => $package_ensure,
  }
}
