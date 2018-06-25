class check_mk::install (
  $site,
  $workspace,
  $filestore = undef,
  $package = undef,
) {
  if $filestore {
    if ! defined(File[$workspace]) {
      file { $workspace:
        ensure => directory,
      }
    }
    file { "${workspace}/${package}":
      ensure  => present,
      source  => "${filestore}/${package}",
      require => File[$workspace],
    }
    package { $package:
      ensure   => installed,
      source   => "${workspace}/${package}",
      require  => File["${workspace}/${package}"],
    }
  }
  else {
    package { $package:
      ensure => installed,
    }
  }
  $etc_dir = "/omd/sites/${site}/etc"
  exec { 'omd-create-site':
    command => "/usr/bin/omd create ${site}",
    creates => $etc_dir,
    require => Package[$package],
  }
}
