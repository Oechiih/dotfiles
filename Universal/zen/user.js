// Zen/Firefox user preferences
// Drop this file in the Zen profile directory — prefs are applied on each startup.
// Profile location: ~/Library/Application Support/zen/Profiles/*.Default (release)/

// --- Telemetry & data collection ---
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

// --- Pocket & sponsored content ---
user_pref("extensions.pocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// --- Privacy ---
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("dom.security.https_only_mode", true);
user_pref("signon.rememberSignons", false);
user_pref("signon.autofillForms", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("browser.formfill.enable", false);
