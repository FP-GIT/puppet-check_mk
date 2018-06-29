define check_mk::host (
  String                $site,
  Stdlib::Fqdn          $fqdn           = $title,
  Array[String]         $host_tags      = [],
) {

  if size($host_tags) > 0 {
    $taglist = join($host_tags,'|')
    $entry = "${fqdn}|${taglist}"
  }
  else {
    $entry = $fqdn
  }

  $conf_dir = Check_mk::Site[$site]['conf_dir']

  file { "${conf_dir}/${fqdn}.mk":
    ensure  => file,
    owner   => $site,
    group   => $site,
    content => epp('check_mk/host.mk.epp'),
  }

}
