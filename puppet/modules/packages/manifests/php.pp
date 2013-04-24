class packages::php inherits packages {

    package { "php":
        ensure => installed,
        ensure => "5.3.5"
    }
}
