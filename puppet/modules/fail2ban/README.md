Fail2ban Puppet Module
======================

This Puppet module can install and manage the Fail2ban service (as 
supplied by the Debian packages).

It supplies the two configuration files and monitors the directories 
containing the action and filter definitions and will restart the 
server when these change. Adding a new filter or action should be a 
matter of adding the new definitions files to `/etc/fail2ban/*.d/` in
another class or node configuration.

    class overreaction {
      file { "/etc/fail2ban/action.d/nuke.conf" :
         ensure  => present,
         source  => "puppet:///modules/overreaction/nuke.conf",
         require => Service["fail2ban"],
      }
    }
