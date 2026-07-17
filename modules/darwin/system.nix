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
      # Always auto-hide the menu bar (paired with
      # AppleMenuBarVisibleInFullscreen = false below).
      _HIHideMenuBar = true;
    };

    dock = {
      tilesize = 64;
      magnification = true;
      largesize = 76;
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
    };

    finder = {
      NewWindowTarget = "Other";
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
        # Pairs with system.defaults.NSGlobalDomain._HIHideMenuBar above to
        # mean "Always" hide (false+true), vs. "On Desktop Only" (true+true).
        AppleMenuBarVisibleInFullscreen = false;
        # Solid/blurred menu bar background instead of fully transparent.
        SLSMenuBarUseBlurredAppearance = true;
        # Text-selection highlight color. RGB float triple + Apple's own
        # name for the preset swatch (System Settings > Appearance >
        # Highlight color > Pink), not an arbitrary pink shade.
        AppleHighlightColor = "1.000000 0.749020 0.823529 Pink";
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
        # Was "NSStatusItem Visible Sound" (wrong key, silently did
        # nothing — the real key has "VisibleCC" in it).
        "NSStatusItem VisibleCC Sound" = true;
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
        gapSize = 0;
        windowSnapping = true;
      };
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # Hotkey 27 = "Move focus to next window" (System Settings >
          # Keyboard > Keyboard Shortcuts > Mission Control), i.e. cycle
          # through windows of the frontmost app. Default is Cmd+`;
          # rebound to Ctrl+§ (keycode 10 = kVK_ISO_Section, the § key on
          # ISO/Swiss-German keyboards; 262144 = Control-only modifier).
          "27" = {
            enabled = true;
            value = {
              type = "standard";
              parameters = [ 167 10 262144 ];
            };
          };
        };
      };
    };
  };
}
