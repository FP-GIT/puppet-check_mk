class check_mk::agent::install (
  Optional[Stdlib::Filesource]  $filestore  = $::check_mk::agent::filestore,
  String                        $package    = $::check_mk::agent::package,
) inherits check_mk::agent {

  @package { 'xinetd':
    ensure => present,
  }

  define cmk_agent_dependencies {
    realize( Package['xinetd'] )
  }

  @::check_mk::agent::install::cmk_agent_dependencies { 'cmk_agent_dependencies': }

  realize( ::Check_mk::Agent::Install::Cmk_agent_dependencies['cmk_agent_dependencies'] )

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
