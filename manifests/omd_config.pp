define check_mk::omd_config (
  String $site,
  String $setting = $title,
  String $value,
) {

  $cmd = "omd config ${site} set ${setting} ${value}"
  $check_cmd = "omd config ${site} show ${setting}"
  exec { $cmd:
    unless => "/bin/bash -c \'[ `${check_cmd}` == \"${value}\" ]\'",
  }

}
