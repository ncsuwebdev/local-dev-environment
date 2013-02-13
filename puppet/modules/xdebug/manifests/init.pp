class xdebug {

    include build, httpd

    exec { "pecl install Xdebug": 
        command => 'printf "\n" | pecl install Xdebug',
        path => ["/usr/bin", "/usr/sbin", "/bin"],
        notify => Exec["/etc/init.d/httpd reload"],
    }

    file { "/etc/php.d/xdebug.ini":
        source => "puppet:///modules/xdebug/etc/php.d/xdebug.ini",
        owner  => "root",
        group  => "root",
        mode   => 644,
    }
}