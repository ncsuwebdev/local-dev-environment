# Class: wrap::install
#
#
class wrap::install {

    file { "/usr/lib64/httpd/modules/mod_auth_wrap.so":
        source => "puppet:///modules/wrap/usr/lib64/httpd/modules/mod_auth_wrap.so",
        mode   => 755,
        owner  => "root",
        group  => "root",
    }

    file { "/etc/httpd/conf.d/wrap.conf":
        source => "puppet:///modules/wrap/etc/httpd/conf.d/wrap.conf",
        owner  => "root",
        group  => "root",
        mode   => 644,
        notify => Exec["/etc/init.d/httpd reload"],
        require => File["/etc/httpd/conf/wrap16.public.pem"]
    }

    file { "/etc/httpd/conf/wrap16.public.pem":
        source => "puppet:///modules/wrap/etc/httpd/conf/wrap16.public.pem",
        owner  => "root",
        group  => "root",
        mode   => 644,
        require => File["/usr/lib64/httpd/modules/mod_auth_wrap.so"]
    }

}