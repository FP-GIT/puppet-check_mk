class check_mk (
  String                      $checkmk_service          = $check_mk::params::checkmk_service,
  Stdlib::Filesource          $filestore                = $check_mk::params::filestore,
  Enum['httpd', 'apache2']    $httpd_service            = $check_mk::params::httpd_service,
  String                      $package                  = $check_mk::params::package,
  String                      $site                     = $check_mk::params::site,
  Stdlib::Absolutepath        $omd_site_path            = $check_mk::params::omd_site_path,
  Optional[String]            $admin_mail               = $check_mk::params::admin_mail,
  Boolean                     $autostart                = $check_mk::params::autostart,
  Enum['nagios', 'icinga']    $core                     = $check_mk::params::core,
  Boolean                     $crontab                  = $check_mk::params::crontab,
  Boolean                     $tmpfs                    = $check_mk::params::tmpfs,
  Enum['own', 'none']         $apache_mode              = $check_mk::params::apache_mode,
  Stdlib::Ip_address          $apache_tcp_address       = $check_mk::params::apache_tcp_address,
  Stdlib::Port::Unprivileged  $apache_tcp_port          = $check_mk::params::apache_tcp_port,
  Enum['welcome', 'nagios', 'icinga', 'check_mk', 'nagvis', 'none']
                              $default_gui              = $check_mk::params::default_gui,
  Boolean                     $dokuwiki_auth            = $check_mk::params::dokuwiki_auth,
  Boolean                     $multisite_authorisation  = $check_mk::params::multisite_authorisation,
  Boolean                     $multisite_cookie_auth    = $check_mk::params::multisite_cookie_auth,
  Enum['classicui', 'exfoliation']
                              $nagios_theme             = $check_mk::params::nagios_theme,
  Boolean                     $mkeventd                 = $check_mk::params::mkeventd,
  Boolean                     $mkeventd_snmptrap        = $check_mk::params::mkeventd_snmptrap,
  Boolean                     $mkeventd_syslog          = $check_mk::params::mkeventd_syslog,
  Boolean                     $mkeventd_syslog_tcp      = $check_mk::params::mkeventd_syslog_tcp,
  Enum['nagios', 'check_mk', 'thruk', 'none']
                              $nagvis_urls              = $check_mk::params::nagvis_urls,
  Boolean                     $pnp4nagios               = $check_mk::params::pnp4nagios,
  Boolean                     $livestatus_tcp           = $check_mk::params::livestatus_tcp,
  Stdlib::Port::Unprivileged  $livestatus_tcp_port      = $check_mk::params::livestatus_tcp_port,
  Boolean                     $nsca                     = $check_mk::params::nsca,
  Stdlib::Port::Unprivileged  $nsca_tcp_port            = $check_mk::params::nsca_tcp_port,
) inherits check_mk::params {

  class { 'check_mk::install':
    filestore => $filestore,
    package   => $package,
    site      => $site,
  }
  ->class { 'check_mk::config':
    site                    => $site,
    omd_site_path           => $omd_site_path,
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
  ~>class { 'check_mk::service':
    checkmk_service => $checkmk_service,
    httpd_service   => $httpd_service,
    site            => $site,
  }

}
