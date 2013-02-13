class fail2ban::configure (
	$jail_local = $fail2ban::params::jail_local,
	$jails = []
) inherits fail2ban::params {

	$fail2ban_loglevel = 3
	$fail2ban_log = '/var/log/fail2ban.log'
	$fail2ban_socket = '/var/run/fail2ban/win2ban.sock'

	file { "/etc/fail2ban/fail2ban.conf" :
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => "640",
		content => template('fail2ban/fail2ban.conf'),
	}

	file { "/etc/fail2ban/jail.conf" :
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => "640",
		content => template('fail2ban/jail.conf'),
	}

	file { $jail_local :
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => 640,
		content => template('fail2ban/jail.local.erb'),
	}

	file { "/etc/fail2ban/action.d" :
		ensure  => directory,
		recurse => true,
		owner   => root,
		group   => root,
	}

	file { "/etc/fail2ban/filter.d" :
		ensure  => directory,
		recurse => true,
		owner   => root,
		group   => root,
	}

	Class['fail2ban::install'] -> Class['fail2ban::configure']
}
