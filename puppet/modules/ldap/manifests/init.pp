class ldap {

    package { ["openldap"]:
        ensure => installed,
    }

    file { "/etc/openldap/ldap.conf":
        source => "puppet:///modules/ldap/etc/openldap/ldap.conf",
        owner  => "root",
        group  => "root",
        mode   => 644,
    }
}
