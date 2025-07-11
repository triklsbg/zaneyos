{ ... }:
{
  # enable creates a config.yml linked to /nix/store
  # with defaults:
  # aliases: {}
  # editor: ''
  # git_protocol: https
  # version: '1'
  #
  programs = {
    # gh complains if home-manager (or nix) takes control over his files
    #
    gh.enable = false;
    gh.settings = {
      git_protocol = "fuck ssh";
      editor = "";
      prompt = "enabled";

      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
}
