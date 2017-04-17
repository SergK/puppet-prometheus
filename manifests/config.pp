# == Class: prometheus::config
#
class prometheus::config (
  $config_path = $prometheus::params::config_dir,
  $file_sd_config_path = $prometheus::params::file_sd_config_dir,
) inherits prometheus::params {

  # though this should be managed by package, let's ensure that it exists
  file { $config_path:
    ensure => 'directory',
    mode   => '0755',
  }

  # add push_gw monitoring
  file { "${config_path}/prometheus.yml":
    content => template('prometheus/prometheus.yml.erb'),
    require => File[$config_path],
    mode    => '0644',
  }

  # ensure we have directory for file_sd_configs
  # https://prometheus.io/docs/operating/configuration/#%3Cfile_sd_config%3E
  file { $file_sd_config_path:
    ensure  => 'directory',
    mode    => '0755',
    require => File[$config_path],
  }

  # add push_gw monitoring
  file { "${file_sd_config_path}/push_gateway.yml":
    content => template('prometheus/push_gateway.yml.erb'),
    require => File[$file_sd_config_path],
    mode    => '0644',
  }

}
