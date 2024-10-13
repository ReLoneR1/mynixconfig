{ config, pkgs, ...}:

{
  services.autorandr.enable = true;
  programs.autorandr = {
    enable = true;
    profiles."default" = {
      fingerprint = {
        DP-2 = "00ffffffffffff004d670924000000000a210104b5351e782feee5a456519b260c4a4fafcf00714f8180810081c0a9c09500b300d1fc023a801871382d4030203500122c2100001a000000fd003090dfdf28010a202020202020000000ff003030303030303030303030300a000000fc004146323448310a202020202020017702032cf14b01020304040e13284d103f230987078301000065030c0010006d1a0000020130900000000000001b8280a07038204017203500122c2100001e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e6";
        DP-4 = "00ffffffffffff004d670924000000000a210104b5351e782feee5a456519b260c4a4fafcf00714f8180810081c0a9c09500b300d1fc023a801871382d4030203500122c2100001a000000fd003090dfdf28010a202020202020000000ff003030303030303030303030300a000000fc004146323448310a202020202020017702032cf14b01020304040e13284d103f230987078301000065030c0010006d1a0000020130900000000000001b8280a07038204017203500122c2100001e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e6";
      };
      config = {
        DP-2 = {
          primary = true;
          mode = "1920x1080";
          rate = "144.00";
        };
        DP-4 = {
          mode = "1920x1080";
          position = "1920x0";
          rate = "144.00";
        };
      };
    };
  };
}
