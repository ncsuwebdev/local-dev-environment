class apc {

    include build, httpd

    exec { "pecl install apc": 
        command => 'printf "\n" | pecl install apc',
        path => ["/usr/bin", "/usr/sbin", "/bin"],
        notify => Exec["/etc/init.d/httpd reload"],
    }

    file { "/etc/php.d/apc.ini":
        source => "puppet:///modules/apc/etc/php.d/apc.ini",
        owner  => "root",
        group  => "root",
        mode   => 644,
    }
}