{ ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        scrollHeight = 2;
        scrollPastBottom = true;
        scrollOffMargin = 2;
        scrollOffBehavior = "margin";
        mouseEvents = true;
        skipDiscardChangeWarning = false;
        skipStashWarning = true;
        skipNoStagedFilesWarning = true;
        skipRewordInEditorWarning = false;
        sidePanelWidth = 0.3333;
        expandFocusedSidePanel = true;
        expandedSidePanelWeight = 2;
        mainPanelSplitMode = "flexible";
        enlargedSideViewLocation = "left";
        language = "auto";
        timeFormat = "02 Jan 06";
        shortTimeFormat = "3:04PM";
        showListFooter = true;
        showFileTree = true;
        showRandomTip = false;
        showCommandLog = false;
        showBottomLine = true;
        showPanelJumps = true;
        showFileIcons = true;
        commitAuthorShortLength = 2;
        commitAuthorLongLength = 17;
        commitHashLength = 0;
        showBranchCommitHash = false;
        showDivergenceFromBaseBranch = "onlyArrow";
        wrapLinesInDiff = true;
        commandLogSize = 8;
        splitDiff = "auto";
        screenMode = "normal";
        border = "rounded";
        animateExplosion = true;
        portraitMode = "auto";
        filterMode = "fuzzy";
        statusPanelView = "dashboard";
        switchToFilesAfterStashPop = true;
        switchToFilesAfterStashApply = true;
        switchTabsWithPanelJumpKeys = false;
        nerdFontsVersion = "3";
        branchColorPatterns = {
          "feature" = "blue";
          "chore" = "yellow";
          "main" = "green";
          "fix" = "red";
        };
        theme = {
          activeBorderColor = [ "#8caaee" "bold" ];
          inactiveBorderColor = [ "#a5adce" ];
          optionsTextColor = [ "#8caaee" ];
          selectedLineBgColor = [ "#414559" ];
          cherryPickedCommitBgColor = [ "#51576d" ];
          cherryPickedCommitFgColor = [ "#8caaee" ];
          unstagedChangesColor = [ "#e78284" ];
          defaultFgColor = [ "#c6d0f5" ];
          searchingActiveBorderColor = [ "#e5c890" ];
        };
        authorColors = {
          "*" = "#babbf1";
        };
      };
      git = {
        autoForwardBranches = "allBranches";
        autoStash = true;
      };
    };
  };
}
