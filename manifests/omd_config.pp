define check_mk::omd_config (
  String                  $site,
  String                  $setting = $title,
  Variant[Scalar, Undef]  $value,
) {

  if $value =~ Boolean {
    $value_string = bool2str($value, 'on', 'off')
  } else {
    $value_string = $value
  }

  $cmd = "/usr/bin/omd config ${site} set ${setting} ${value_string}"
  $check_cmd = "/usr/bin/omd config ${site} show ${setting}"
  exec { $cmd:
    onlyif => "/bin/bash -c \'[ `${check_cmd}` != \"${value_string}\" ]\'",
  }

}
