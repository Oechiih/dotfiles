{ ... }: {
  programs.ssh = {
    enable = true;
    # enableDefaultConfig auto-injects these into settings."*" but is
    # deprecated; declared explicitly below instead, same values.
    enableDefaultConfig = false;
    settings = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
        # Quoted: the path contains spaces ("Group Containers"), and an
        # unquoted value breaks ssh_config parsing for the *entire* file,
        # not just this line.
        identityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
      };
    };
  };
}
