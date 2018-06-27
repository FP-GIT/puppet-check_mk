class check_mk::agent::install (
  Optional[Stdlib::Filesource]  $filestore  = $::check_mk::agent::filestore,
  String                        $package    = $::check_mk::agent::package,
) inherits check_mk::agent {

  ensure_package { 'xinetd', {
    ensure => present,
  }}

  if $filestore {
    $package_name = "${filestore}/${package}"
    deb_package{ $package_name:
      require => Package['xinetd']
    }
  }
  else {
    $package_name = $package
    package { $package_name:
      ensure  => present,
      name    => $check_mk_agent,
      require => Package['xinetd']
    }
  }
}
