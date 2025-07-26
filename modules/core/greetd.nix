{
  pkgs,
  username,
  ...
}:
{
  services.greetd = {
    enable = true;
    vt = 3;
    # autologin doesn't work like wiki entry trikl
    # settings = rec {
      #   initial_session = {
        #     command = default_session;
        #     user = username;
        #   };
        settings = {

          initial_session = {
          command = "Hyprland";
          user = username;
          };

          default_session = {
            user = username;
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
          };
        };
  };
}
