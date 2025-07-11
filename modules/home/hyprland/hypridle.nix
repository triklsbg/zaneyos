{ ... }:

{
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };
        listener = [
          {
            timeout = 9000; # in seconds 900 = 15 min
            on-timeout = "hyprlock";
          }
          {
            # strom sparen nach 1200 sekunden
            timeout = 1200; # was 1200
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
