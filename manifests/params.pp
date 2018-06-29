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

}
