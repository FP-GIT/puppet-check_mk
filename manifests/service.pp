class check_mk::service (
  $checkmk_service,
  $httpd_service,
  $site,
) {
  if ! defined(Service[$httpd_service]) {
    service { $httpd_service:
      ensure => 'running',
      enable => true,
    }
  }
  if ! defined(Service[xinetd]) {
    service { 'xinetd':
      ensure => 'running',
      enable => true,
    }
  }
  service { $checkmk_service:
    ensure => 'running',
    enable => true,
  }
  ~>exec { 'start ${site}':
    command => "/usr/bin/omd start ${site}",
    unless  => "/usr/bin/omd status ${site} | /bin/grep \"OVERALL 1\"",
  }

}
