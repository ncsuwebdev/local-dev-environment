class build {

    yumrepo { "epel":
        baseurl => "http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm",
        descr => "IUS Community repository",
        enabled => 1,
        gpgcheck => 0
   }

    package { [
                "php", 
                "php-pear",
                "php-devel",
                "pcre-devel",
                "gcc",
                "make",
              ]:
        ensure => installed,
    }

    package { "libssh2":
        ensure => installed,
    }

    

    package { [
                "php-gd",
                "php-mbstring",
                "php-mcrypt",
                "php-domxml-php4-php5",
                "php-pecl-apc.x86_64"
              ]:
        ensure => installed,
        require => Yumrepo["epel"]
    }

    package { 
        [
            "java-1.6.0-openjdk"
        ]:
        ensure => installed
    }
}
