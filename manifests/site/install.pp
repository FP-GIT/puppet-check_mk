define check_mk::site::install (
  String                      $site = $title,
  Stdlib::Absolutepath        $omd_site_path,
  String                      $cmk_confd_path,
) {

  assert_private( "This class is private. Please don't instantiate yourself." )

  $site_path  = "${omd_site_path}/${site}"
  $conf_dir   = "${site_path}/${cmk_confd_path}/puppet"

  exec { "Check_Mk site ${site}":
    command => "/usr/bin/omd create ${site}",
    unless  => "/usr/bin/omd sites | /bin/grep ${site}",
  }
  ->file { $conf_dir:
    ensure  => folder,
    owner   => $site,
    group   => $site,
  }

}

