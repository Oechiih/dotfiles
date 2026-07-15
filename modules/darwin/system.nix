{ ... }: {
  system.defaults = {

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    loginwindow.GuestEnabled = false;
    screensaver.askForPassword = true;

    menuExtraClock = {
      Show24Hour = true;
      ShowDayOfWeek = false;
    };

    NSGlobalDomain = {
      AppleInterfaceStyleSwitchesAutomatically = true;
      NSTableViewDefaultSizeMode = 1;
      AppleShowAllExtensions = true;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      "com.apple.sound.beep.feedback" = 1;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSWindowShouldDragOnGesture = true;
    };

    dock = {
      tilesize = 32;
      magnification = true;
      largesize = 44;
      minimize-to-application = true;
      show-process-indicators = true;
      mru-spaces = false;
      show-recents = false;
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.5;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      persistent-apps = [
        "/Applications/Zen.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Messages.app"
        "/System/Applications/Calendar.app"
        "/System/Applications/Music.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/Ghostty.app"
        "/Applications/1Password.app"
        "/Applications/Reeder.app"
        "/Applications/Mela.app"
        "/Applications/Royal TSX.app"
        "/Applications/Discord.app"
        "/Applications/IBKR Desktop.app"
        "/Applications/TradingView.app"
        "/Applications/Infuse.app"
        "/Applications/Bambu Studio.app"
      ];
    };

    finder = {
      NewWindowTarget = "PfLo";
      NewWindowTargetPath = "file:///Users/joe/git/";
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      ShowStatusBar = true;
      ShowPathbar = true;
      _FXSortFoldersFirst = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      CreateDesktop = false;
    };

    trackpad = {
      Clicking = true;
      Dragging = true;
      TrackpadThreeFingerDrag = true;
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleWindowTabbingMode = "always";
        NSCloseAlwaysConfirmsChanges = true;
        WebKitDeveloperExtras = true;
      };
      "com.apple.finder" = {
        FXICloudDriveDesktop = true;
        FXICloudDriveDocuments = true;
        FXRemoveOldTrashItems = true;
      };
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.screencapture" = {
        target = "clipboard";
        "disable-shadow" = true;
      };
      "com.apple.controlcenter" = {
        "NSStatusItem Visible Sound" = true;
        BatteryShowPercentage = true;
      };
      "com.apple.menuextra.battery" = {
        ShowPercent = true;
      };
      "com.apple.Siri" = {
        StatusMenuVisible = false;
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      "com.apple.TextEdit" = {
        RichText = false;
      };
      "com.apple.Accessibility" = {
        AXSSpatialAudioHeadTracking = false;
      };
      "com.apple.ImageCapture" = {
        disableHotPlug = true;
      };
      "com.apple.WindowManager" = {
        StandardHideWidgets = true;
        StageManagerHideWidgets = true;
      };
      "com.knollsoft.Rectangle" = {
        launchOnLogin = true;
        hideMenubarIcon = false;
        gapSize = 8;
        windowSnapping = true;
      };
    };
  };
}
