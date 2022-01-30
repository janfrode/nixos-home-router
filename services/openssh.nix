{ pkgs, lib, ... }:{

   services.openssh = {
     enable = true;
     passwordAuthentication = false;
     challengeResponseAuthentication = false;
     extraConfig = ''
       AllowTcpForwarding yes
       X11Forwarding no
       AllowAgentForwarding yes
       AllowStreamLocalForwarding no
       AuthenticationMethods publickey
    '';
   };
}
