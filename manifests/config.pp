class check_mk::config (
  String                      $site,
  Stdlib::Absolutepath        $omd_site_path,
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
  Stdlib::Port::Unprivileged  $livestatus_tcp_port,
  Boolean                     $nsca,
  Stdlib::Port::Unprivileged  $nsca_tcp_port,
) {
  if $admin_mail {
    validate_email_address($admin_mail)
  }

  $autostart_str                = bool2str($autostart, 'on', 'off')
  $crontab_str                  = bool2str($crontab, 'on', 'off')
  $dokuwiki_auth_str            = bool2str($dokuwiki_auth, 'on', 'off')
  $livestatus_tcp_str           = bool2str($livestatus_tcp, 'on', 'off')
  $mkeventd_str                 = bool2str($mkeventd, 'on', 'off')
  $mkeventd_snmptrap_str        = bool2str($mkeventd_snmptrap, 'on', 'off')
  $mkeventd_syslog_str          = bool2str($mkeventd_syslog, 'on', 'off')
  $mkeventd_syslog_tcp_str      = bool2str($mkeventd_syslog_tcp, 'on', 'off')
  $multisite_authorisation_str  = bool2str($multisite_authorisation, 'on', 'off')
  $multisite_cookie_auth_str    = bool2str($multisite_cookie_auth, 'on', 'off')
  $nsca_str                     = bool2str($nsca, 'on', 'off')
  $pnp4nagios_str               = bool2str($pnp4nagios, 'on', 'off')
  $tmpfs_str                    = bool2str($tmpfs, 'on', 'off')

  $site_conf = "${omd_site_path}/${site}/etc/omd/site.conf"
  file { $site_conf:
    ensure  => 'file',
    content => epp('puppet://modules/puppet-check_mk/site.conf.epp'),
    owner   => $site,
    group   => $site,
    mode    => '0644',
  }
}
