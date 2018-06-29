define check_mk::site (
  String                      $site                     = $title,
  String                      $siteadmin_passwordhash,
  Stdlib::Absolutepath        $omd_site_path            = $::check_mk::omd_site_path,
  String                      $omd_siteconf_path        = $::check_mk::omd_siteconf_path,
  String                      $cmk_confd_path           = $::check_mk::cmk_confd_path,
  String                      $cmk_htpasswd_path        = $::check_mk::cmk_htpasswd_path,
  Optional[String]            $admin_mail               = $::check_mk::site::params::admin_mail,
  Boolean                     $autostart                = $::check_mk::site::params::autostart,
  Enum['nagios', 'icinga']    $core                     = $::check_mk::site::params::core,
  Boolean                     $crontab                  = $::check_mk::site::params::crontab,
  Boolean                     $tmpfs                    = $::check_mk::site::params::tmpfs,
  Enum['own', 'none']         $apache_mode              = $::check_mk::site::params::apache_mode,
  Stdlib::Ip_address          $apache_tcp_address       = $::check_mk::site::params::apache_tcp_address,
  Stdlib::Port::Unprivileged  $apache_tcp_port          = $::check_mk::site::params::apache_tcp_port,
  Enum['welcome', 'nagios', 'icinga', 'check_mk', 'nagvis', 'none']
                              $default_gui              = $::check_mk::site::params::default_gui,
  Boolean                     $dokuwiki_auth            = $::check_mk::site::params::dokuwiki_auth,
  Boolean                     $multisite_authorisation  = $::check_mk::site::params::multisite_authorisation,
  Boolean                     $multisite_cookie_auth    = $::check_mk::site::params::multisite_cookie_auth,
  Enum['classicui', 'exfoliation']
                              $nagios_theme             = $::check_mk::site::params::nagios_theme,
  Boolean                     $mkeventd                 = $::check_mk::site::params::mkeventd,
  Boolean                     $mkeventd_snmptrap        = $::check_mk::site::params::mkeventd_snmptrap,
  Boolean                     $mkeventd_syslog          = $::check_mk::site::params::mkeventd_syslog,
  Boolean                     $mkeventd_syslog_tcp      = $::check_mk::site::params::mkeventd_syslog_tcp,
  Enum['nagios', 'check_mk', 'thruk', 'none']
                              $nagvis_urls              = $::check_mk::site::params::nagvis_urls,
  Boolean                     $pnp4nagios               = $::check_mk::site::params::pnp4nagios,
  Boolean                     $livestatus_tcp           = $::check_mk::site::params::livestatus_tcp,
  Stdlib::Port::Unprivileged  $livestatus_tcp_port      = $::check_mk::site::params::livestatus_tcp_port,
  Boolean                     $nsca                     = $::check_mk::site::params::nsca,
  Stdlib::Port::Unprivileged  $nsca_tcp_port            = $::check_mk::site::params::nsca_tcp_port,
) {

  check_mk::site::install { $site:
    omd_site_path   => $omd_site_path,
    cmk_confd_path  => $cmk_confd_path,
  }

  check_mk::site::config { $site:
    omd_site_path           => $omd_site_path,
    omd_siteconf_path       => $omd_siteconf_path,
    cmk_htpasswd_path       => $cmk_htpasswd_path,
    siteadmin_passwordhash  => $siteadmin_passwordhash,
    admin_mail              => $admin_mail,
    autostart               => $autostart,
    core                    => $core,
    crontab                 => $crontab,
    tmpfs                   => $tmpfs,
    apache_mode             => $apache_mode,
    apache_tcp_address      => $apache_tcp_address,
    apache_tcp_port         => $apache_tcp_port,
    default_gui             => $default_gui,
    dokuwiki_auth           => $dokuwiki_auth,
    multisite_authorisation => $multisite_authorisation,
    multisite_cookie_auth   => $multisite_cookie_auth,
    nagios_theme            => $nagios_theme,
    mkeventd                => $mkeventd,
    mkeventd_snmptrap       => $mkeventd_snmptrap,
    mkeventd_syslog         => $mkeventd_syslog,
    mkeventd_syslog_tcp     => $mkeventd_syslog_tcp,
    nagvis_urls             => $nagvis_urls,
    pnp4nagios              => $pnp4nagios,
    livestatus_tcp          => $livestatus_tcp,
    livestatus_tcp_port     => $livestatus_tcp_port,
    nsca                    => $nsca,
    nsca_tcp_port           => $nsca_tcp_port,
  }

  check_mk::site::service { $site: }

  Check_mk::Site::Install[$site]->Check_mk::Site::Config[$site]~>Check_mk::Site::Service[$site]
  Check_mk::Site::Install[$site]~>Check_mk::Site::Service[$site]

}

