class monit {
    package { ["monit"]:
        ensure => installed,
    }

/*
    service { "monit":
        enable     => true,
        ensure     => running,
        subscribe  => Package["monit"],
    }

    file { "/etc/monitrc":
        source => "puppet:///modules/monit/etc/monitrc",
        owner  => "root",
        group  => "root",
        mode   => 644,
    }
*/
}
