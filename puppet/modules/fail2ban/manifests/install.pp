class fail2ban::install {

    file { "/usr/src/fail2ban-0.8.4.tar.bz2":
        source => "puppet:///modules/fail2ban/fail2ban-0.8.4.tar.bz2"
    }

    common::archive::extract { "fail2ban-0.8.4":
        ensure     => present,
        src_target => "/usr/src",
        timeout    => 600,
        extension  => "tar.bz2",
        target     => "/usr/src",
        require    => File["/usr/src/fail2ban-0.8.4.tar.bz2"],
    }

    exec { "python setup.py install": 
        command => "python setup.py install",
        cwd     => "/usr/src/fail2ban-0.8.4",
        path    => ["/usr/bin", "/usr/sbin", "/bin"],
        require => Common::Archive::Extract["fail2ban-0.8.4"],
    }

    file { '/etc/init.d/fail2ban':
        source  => "/usr/src/fail2ban-0.8.4/files/redhat-initd",
        ensure  => present,
        require => Exec["python setup.py install"],
    }

    exec { "chkconfig --add fail2ban": 
        command => "chkconfig --add fail2ban",
        path    => ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
        require => File["/etc/init.d/fail2ban"],
    }

    exec { "chkconfig fail2ban on": 
        command => "chkconfig fail2ban on",
        path    => ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
        require => Exec["chkconfig --add fail2ban"],
    }
    
    
}

