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

  # ensure we have directory for file_sd_configs
  # https://prometheus.io/docs/operating/configuration/#%3Cfile_sd_config%3E
  file { $file_sd_config_path:
    ensure  => 'directory',
    mode    => '0755',
    require => File[$config_path],
  }

}
