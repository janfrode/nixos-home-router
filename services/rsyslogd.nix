{ pkgs, lib, ... }:{

  # Enable rsyslog
  services.rsyslogd = {
    enable = true;
    defaultConfig = ''
      # Provides UDP syslog reception
      $ModLoad imudp
      $UDPServerRun 514
      #$AllowedSender UDP, 172.20.50.2

      # Provides TCP syslog reception
      #$ModLoad imtcp
      #$InputTCPServerRun 514

      # "local1" is used for dhcpd messages.
      local1.*                     -/var/log/dhcpd

      mail.*                       -/var/log/mail
      
      *.=warning;*.=err            -/var/log/warn
      *.crit                        /var/log/warn
      
      *.*;mail.none;local1.none    -/var/log/messages
    '';
  };
}
