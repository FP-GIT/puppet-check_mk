class check_mk::install (
  Stdlib::Filesource  $filestore,
  String              $package,
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

}
