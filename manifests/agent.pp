class check_mk::agent (
  Optional[Stdlib::Filesource]  $filestore    = undef,
  String                        $package,
  Array[Stdlib::Ip_address]     $ip_whitelist = [],
  Stdlib::Port::Unprivileged    $port         = 6556,
  String                        $user         = 'root',
  Stdlib::Absolutepath          $server       = '/user/bin/check_mk_agent',
) {

  include check_mk::agent::install
  include check_mk::agent::config
  include check_mk::agent::service

  Class['check_mk::agent::install']
  ->Class['check_mk::agent::config']
  ~>Class['check_mk::agent::service']

}
