class check_mk::site::service (
  String $site = $title,
) {

  assert_private( "This class is private. Please don't instantiate yourself." )

  service { "Check_mk site ${site} starting service":
    ensure    => running,
    provider  => 'base',
    start     => "/usr/bin/omd start ${site}",
    stop      => "/usr/bin/omd stop ${site}",
    restart   => "/usr/bin/omd start ${site}",
    status    => "/usr/bin/omd status -b ${site} | /bin/grep \"OVERALL 1\"",
  }

}
