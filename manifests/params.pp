class check_mk::params {

  # common variables
  $checkmk_service    = 'omd'
  $package            = undef
  $filestore          = undef
  $omd_site_path      = '/opt/omd/sites'
  $omd_siteconf_path  = 'etc/site.conf'
  $cmk_confd_path     = 'etc/check_mk/conf.d'
  $cmk_htpasswd_path  = 'etc/htpasswd'

  # OS specific variables
  case $::osfamily {
    'RedHat': {
      $httpd_service = 'httpd'
    }
    'Debian': {
      $httpd_service = 'apache2'
    }
    default: {
      fail("OS familly ${::osfamily} is not managed!")
    }
  }

  # Site specific params
  $site_admin_mail              = undef
  $site_autostart               = true
  $site_core                    = 'nagios'
  $site_crontab                 = true
  $site_tmpfs                   = true
  $site_apache_mode             = 'own'
  $site_apache_tcp_address      = '127.0.0.1'
  $site_apache_tcp_port         = 5000
  $site_default_gui             = 'check_mk'
  $site_dokuwiki_auth           = false
  $site_multisite_authorisation = true
  $site_multisite_cookie_auth   = true
  $site_nagios_theme            = 'classicui'
  $site_mkeventd                = true
  $site_mkeventd_snmptrap       = false
  $site_mkeventd_syslog         = false
  $site_mkeventd_syslog_tcp     = false
  $site_nagvis_urls             = 'check_mk'
  $site_pnp4nagios              = true
  $site_livestatus_tcp          = false
  $site_livestatus_tcp_port     = 6557
  $site_nsca                    = false
  $site_nsca_tcp_port           = 5667

}
