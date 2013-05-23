class xdebug {

    include build, httpd

    package { "php-pecl-xdebug":
        ensure => installed,
        notify => Exec["/etc/init.d/httpd reload"],
    }


    file { "/etc/php.d/xdebug-config.ini":
        source => "puppet:///modules/xdebug/etc/php.d/xdebug-config.ini",
        owner  => "root",
        group  => "root",
        mode   => 644,
    }
}