{ pkgs, lib, ... }:{

   services.chrony = {
     enable = true;
     extraConfig = ''
       allow 192.168.1
       allow 172.20
       '';
   };
}
