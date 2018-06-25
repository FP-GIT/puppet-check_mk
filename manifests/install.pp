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
    if $package =~ /^(.*)\.(rpm|deb)$/ {
      $package_name = $1
      $type         = $2
      package { $package_name:
        ensure   => installed,
        provider => $type ? {
          'deb' => 'dpkg',
          'rpm' => 'rpm',
        },
        source   => "${workspace}/${package}",
        require  => File["${workspace}/${package}"],
      }
    } else {
      fail ("'${package_name}' neither sepcifies a deb nor a rpm package")
    }
  }
  else {
    $package_name = $package
    package { $package_name:
      ensure => installed,
    }
  }
  $etc_dir = "/omd/sites/${site}/etc"
  exec { 'omd-create-site':
    command => "/usr/bin/omd create ${site}",
    creates => $etc_dir,
    require => Package[$package_name],
  }
}
