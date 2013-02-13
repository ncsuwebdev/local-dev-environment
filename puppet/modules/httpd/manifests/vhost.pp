# Definition: httpd::vhost
#
# This class installs Apache Virtual Hosts
#
# Parameters:
# - The $port to configure the host on
# - The $docroot provides the DocumentationRoot variable
# - The $template option specifies whether to use the default template or override
# - The $priority of the site
# - The #serveraliases of the site
# - The $options for the given vhost
# - The $vhost_name for the name based virtualhosting, defaulting to *
#
# Actions:
# - Install Apache Virtual Hosts
#
# Requires:
# - The httpd class
# 
# Sample Usage:
#  httpd::vhost { 'site.name.fqdn':
#     priority => '20',
#     port => '80',
#     docroot => '/path/to/docroot',
#  }
#
define httpd::vhost(
    $port,
    $docroot,
    $template      = 'httpd/vhost-default.conf.erb',
    $priority      = '25',
    $servername    = '',
    $serveraliases = '',
    $options       = 'Indexes FollowSymlinks MultiViews',
    $vhost_name    = '*'
) {

  include httpd

  # Below is a pre-2.6.5 idiom for having a parameter default to the title,
  # but you could also just declare $servername = "$title" in the parameters
  # list and change srvname to servername in the template

  if $servername == '' {
      $srvname = $title
  } else {
      $srvname = $servername
  }

  $vdir   = '/etc/httpd/vhosts.d'
  $logdir = '/var/log/httpd'

  file {
      "${vdir}/${priority}-${name}.conf":
      content => template($template),
      owner   => 'root',
      group   => 'root',
      mode    => '755',
      require => Package['httpd'],
      notify  => Service['httpd'],
  }

  file { 
      "${docroot}":
      ensure => directory
  }

  file {
      "${docroot}/index.html":
      content => "${name}",
      ensure  => file,
      require => File["${docroot}"]
  }
}
