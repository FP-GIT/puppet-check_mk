define check_mk::site (
  String                $name                   = $title,
  String                $siteadmin_passwordhash,
  Stdlib::Absolutepath  $omd_site_path          = check_mk::params::omd_site_path,
  String                $cmk_confd_path         = check_mk::params::cmk_confd_path,
  String                $cmk_htpasswd_path      = check_mk::params::cmk_htpasswd_path,
) {

  $conf_dir = "${omd_site_path}/${name}/${cmk_confd_path}/puppet"

  exec { "Check_Mk site ${name}":
    command => "/usr/bin/omd create ${name}",
    unless  => "/usr/bin/omd sites | /bin/grep ${name}",
  }
  ->file { $conf_dir:
    ensure  => folder,
    owner   => $name,
    group   => $name,
  }

  htpasswd { 'cmkadmin':
    cryptpasswd => $siteadmin_passwordhash,
    target      => $cmk_htpaddwd_path,
    require     => Exec["Check_Mk site ${name}"],
  }

}

