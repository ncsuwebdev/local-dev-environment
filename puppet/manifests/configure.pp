include baseline

node default { 
    include puppet
    include httpd
    include build
    include mysqld
    include xdebug
    include wrap

    file { '/var/www/html/index.html' :
        ensure => present,
        content => "<!-- welcome to the internet -->",
        require => Package['httpd']
    }

    file { '/var/www/html/info.php' :
        ensure => present,
        content => "<?php phpinfo();",
        require => Package['httpd']
    }

    file { '/var/www/html/.htaccess' :
        ensure => present,
        content => "SetEnv APPLICATION_ENV \"development\"",
        require => Package['httpd']
    }

    exec { "set timezone":
      command => "/bin/ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime",
      refreshonly => true
    }
    
}