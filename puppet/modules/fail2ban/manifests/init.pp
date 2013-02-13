class fail2ban {

	include fail2ban::install
	include fail2ban::configure
	include fail2ban::service

}

