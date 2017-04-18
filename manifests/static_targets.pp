# == Define: prometheus::static_targets
#
#   Example usage:
#     ::prometheus::static_targets { 'cassandra':
#       targets => [
#         '192.168.1.100:7070',
#       ],
#       labels  => {
#         'lbl'    => 'run-cluster',
#         'status' => 'no-running',
#       }
#     }

define prometheus::static_targets (
  $targets,
  $labels  = undef,
) {
  include prometheus::params # contains common config settings

  # define path where we store our files with static targets
  $file_sd_config_path = $::prometheus::params::file_sd_config_dir

  # add targets to file_sd uder name of definition
  file { "${file_sd_config_path}/${name}.yml":
    content => template('prometheus/static_targets.yml.erb'),
    require => File[$file_sd_config_path],
    mode    => '0644',
  }
}
