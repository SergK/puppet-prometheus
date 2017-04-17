# @api private
# This class handles prometheus packages. Avoid modifying private classes.
class prometheus::install inherits prometheus::params {

    package { $prometheus::params::package_name:
      ensure => $prometheus::params::package_ensure,
    }

}
