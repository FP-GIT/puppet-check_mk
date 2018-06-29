class check_mk (
  String                      $checkmk_service          = $check_mk::params::checkmk_service,
  Enum['httpd', 'apache2']    $httpd_service            = $check_mk::params::httpd_service,
  Stdlib::Filesource          $filestore                = $check_mk::params::filestore,
  String                      $package                  = $check_mk::params::package,
) inherits check_mk::params {

  contain 'check_mk::install'
  contain 'check_mk::service'

  Class['Check_mk::Install']~>Class['Check_mk::Service']

}
