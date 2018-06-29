define check_mk::site (
  String                $name           = $title,
  Stdlib::Absolutepath  $omd_site_path  = check_mk::params::omd_site_path,
  String                $cmk_confd_path = check_mk::params::cmk_confd_path,
) {

  $conf_dir = "${omd_site_path}/${site}/${cmk_confd_path}/puppet"

  exec { "Check_Mk site ${name}":
    command => "/usr/bin/omd create ${name}",
    unless  => "/usr/bin/omd sites | /bin/grep ${name}",
  }
  ->file { $conf_dir:
    ensure => folder,
    owner  => $site,
    group  => $site,
  }

}

