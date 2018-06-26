class check_mk::config (
  String                      $site,
  Optional[String]            $admin_mail,
  Boolean                     $autostart,
  Enum['nagios', 'icinga']    $core,
  Boolean                     $crontab,
  Boolean                     $tmpfs,
  Enum['own', 'none']         $apache_mode,
  Stdlib::Ip_address          $apache_tcp_address,
  Stdlib::Port::Unprivileged  $apache_tcp_port,
  Enum['welcome', 'nagios', 'icinga', 'check_mk', 'nagvis', 'none']
                              $default_gui,
  Boolean                     $dokuwiki_auth,
  Boolean                     $multisite_authorisation,
  Boolean                     $multisite_cookie_auth,
  Enum['classicui', 'exfoliation']
                              $nagios_theme,
  Boolean                     $mkeventd,
  Boolean                     $mkeventd_snmptrap,
  Boolean                     $mkeventd_syslog,
  Boolean                     $mkeventd_syslog_tcp,
  Enum['nagios', 'check_mk', 'thruk', 'none']
                              $nagvis_urls,
  Boolean                     $pnp4nagios,
  Boolean                     $livestatus_tcp,
  Boolean                     $nsca,
) {
  if $admin_mail {
    validate_email_address($admin_mail)
  }

  #  Check_mk::Omd_setting {
  #    site => $site,
  #  }

  check_mk::omd_setting { 'ADMIN_MAIL':
    value => $admin_mail,
  }
  check_mk::omd_setting { 'AUTOSTART':
    value => $autostart,
  }
  check_mk::omd_setting { 'CORE':
    value => $core,
  }
  check_mk::omd_setting { 'CRONTAB':
    value => $crontab,
  }
  check_mk::omd_setting { 'TMPFS':
    value => $tmpfs,
  }
  check_mk::omd_setting { 'APACHE_MODE':
    value => $apache_mode,
  }
  check_mk::omd_setting { 'APACHE_TCP_ADDRESS':
    value => $apache_tcp_address,
  }
  check_mk::omd_setting { 'APACHE_TCP_PORT':
    value => $apache_tcp_port,
  }
  check_mk::omd_setting { 'DEFAULT_GUI':
    value => $default_gui,
  }
  check_mk::omd_setting { 'DOKUWIKI_AUTH':
    value => $dokuwiki_auth,
  }
  check_mk::omd_setting { 'MULTISITE_AUTHORISATION':
    value => $multisite_authorisation,
  }
  check_mk::omd_setting { 'MULTISITE_COOKIE_AUTH':
    value => $multisite_cookie_auth,
  }
  check_mk::omd_setting { 'NAGIOS_THEME':
    value => $nagios_theme,
  }
  check_mk::omd_setting { 'MKEVENTD':
    value => $mkeventd,
  }
  check_mk::omd_setting { 'MKEVENTD_SNMPTRAP':
    value => $mkeventd_snmptrap,
  }
  check_mk::omd_setting { 'MKEVENTD_SYSLOG':
    value => $mkeventd_syslog,
  }
  check_mk::omd_setting { 'MKEVENTD_SYSLOG_TCP':
    value => $mkeventd_syslog_tcp,
  }
  check_mk::omd_setting { 'NAGVIS_URLS':
    value => $nagvis_urls,
  }
  check_mk::omd_setting { 'PNP4NAGIOS':
    value => $pnp4nagios,
  }
  check_mk::omd_setting { 'LIVESTATUS_TCP':
    value => $livestatus_tcp,
  }
  check_mk::omd_setting { 'NSCA':
    value => $nsca,
  }

}
