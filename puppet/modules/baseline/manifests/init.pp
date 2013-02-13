class baseline {  
    
    Service {
        hasstatus => true,
        hasrestart => true
    }

    include puppet
    include monit

    package { [
                "perl-Time-HiRes",
                "tree",
                "screen",
                "git",
              ]:
        ensure => installed,
    }

    service { "crond":
        enable => true,
        ensure => running,
    }
}
