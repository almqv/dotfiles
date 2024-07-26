{ config, pkgs, ... }:

{
  # config
  # service
  home.file."Library/LaunchAgents/org.nixos.yabai.plist" = {
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>org.nixos.yabai</string>
        <key>ProgramArguments</key>
        <array>
          <string>${pkgs.yabai}/bin/yabai</string>
        </array>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
          <string>${pkgs.yabai}/bin:${pkgs.bash}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
        </dict>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>${config.home.homeDirectory}/.yabai.out.log</string>
        <key>StandardErrorPath</key>
        <string>${config.home.homeDirectory}/.yabai.err.log</string>
      </dict>
      </plist>
    '';
  };
}
