class check_mk::site::params {

  $admin_mail               = undef
  $autostart                = true
  $core                     = 'nagios'
  $crontab                  = true
  $tmpfs                    = true
  $apache_mode              = 'own'
  $apache_tcp_address       = '127.0.0.1'
  $apache_tcp_port          = 5000
  $default_gui              = 'check_mk'
  $dokuwiki_auth            = false
  $multisite_authorisation  = true
  $multisite_cookie_auth    = true
  $nagios_theme             = 'classicui'
  $mkeventd                 = true
  $mkeventd_snmptrap        = false
  $mkeventd_syslog          = false
  $mkeventd_syslog_tcp      = false
  $nagvis_urls              = 'check_mk'
  $pnp4nagios               = true
  $livestatus_tcp           = false
  $livestatus_tcp_port      = 6557
  $nsca                     = false
  $nsca_tcp_port            = 5667

}
