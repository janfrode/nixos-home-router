{ pkgs, lib, ... }:{

   services.openssh = {
     enable = true;
     passwordAuthentication = false;
     challengeResponseAuthentication = false;
     extraConfig = ''
       AllowTcpForwarding yes
       X11Forwarding no
       AllowAgentForwarding no
       AllowStreamLocalForwarding no
       AuthenticationMethods publickey
    '';
   };
}
