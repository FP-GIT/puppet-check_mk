class check_mk::install (
  $site,
  $filestore = undef,
  $package = undef,
) {

  if $filestore {
    $package_name = "${filestore}/${package}"
    deb_package{ $package_name: }
  }
  else {
    $package_name = $package
    package { $package_name:
      ensure => installed,
    }
  }
  ->exec { 'omd-create-site':
    command => "/usr/bin/omd create ${site}",
    unless  => "/usr/bin/omd sites | /bin/grep ${site}",
  }

}
