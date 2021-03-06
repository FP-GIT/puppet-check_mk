class check_mk::service (
  String $checkmk_service = $check_mk::checkmk_service,
  String $httpd_service   = $check_mk::httpd_service,
) {

  if ! defined(Service[$httpd_service]) {
    service { $httpd_service:
      ensure => 'running',
      enable => true,
    }
  }
  if ! defined(Service['xinetd']) {
    service { 'xinetd':
      ensure => 'running',
      enable => true,
    }
  }
  service { $checkmk_service:
    ensure => 'running',
    enable => true,
  }

}
