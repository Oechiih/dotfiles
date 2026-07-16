{ ... }: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        # Quoted: the path contains spaces ("Group Containers"), and an
        # unquoted value breaks ssh_config parsing for the *entire* file,
        # not just this line.
        identityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
      };
    };
  };
}
