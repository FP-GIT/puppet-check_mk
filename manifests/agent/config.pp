# == Class: check_mk::agent::config
#
# Configure check_mk agent.
#
# === Parameters
#
# [*ip_whitelist*]
#   Array of IP allowed to access the check_mk agent.
#   Default: undef
#
# [*port*]
#   Check_mk port
#   Default: undef
#
# [*server_dir*]
#   Check_mk server directory.
#   Default: undef
#
# [*use_cache*]
#   Enable cache.
#   Default: undef
#
# [*user*]
#   Check_mk user.
#   Default: undef
#
class check_mk::agent::config (
  $ip_whitelist = $::check_mk::agent::ip_whitelist,
  $port         = $::check_mk::agent::port,
  $user         = $::check_mk::agent::user,
) inherits check_mk::agent {

  if $ip_whitelist {
    $only_from = join($ip_whitelist, ' ')
  } else {
    $only_from = undef
  }

  $xinetd_file = $::osfamily ? {
    'RedHat' => '/etc/xinetd.d/check-mk-agent',
    default  => '/etc/xinetd.d/check_mk',
  }

  file { $xinetd_file:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => epp('check_mk/agent/check_mk.epp'),
  }
}

