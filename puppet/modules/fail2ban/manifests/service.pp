class fail2ban::service {

	service { "fail2ban" :
		ensure     => running,
		enable     => true,
		hasstatus  => true,
		hasrestart => true,
	}


	Class['fail2ban::configure'] ~> Class['fail2ban::service']

}

