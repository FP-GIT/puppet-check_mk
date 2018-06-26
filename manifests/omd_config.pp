define check_mk::omd_config (
  String $site,
  String $setting = $title,
  Data $value,
) {

  $cmd = "/usr/bin/omd config ${site} set ${setting} '${value}'"
  $check_cmd = "/usr/bin/omd config ${site} show ${setting}"
  exec { $cmd:
    onlyif => "/bin/bash -c \'[ `${check_cmd}` != \"${value}\" ]\'",
  }

}
