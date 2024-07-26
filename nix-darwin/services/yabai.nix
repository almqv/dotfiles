{ config, pkgs, ... }:

let 
  fullScriptPath = ".scripts/yabai-daemon.sh";
in
{
  home.file."Library/LaunchAgents/org.yabaios.autostart.plist" = {
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>org.yabaios.autostart</string>
        <key>ProgramArguments</key>
        <array>
          <string>${pkgs.bash}/bin/bash</string>
          <string>${fullScriptPath}</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <false/>
      </dict>
      </plist>
    '';
  };

  home.file."${fullScriptPath}" = {
    text = ''
      yabai --start-service
    '';
    executable = true;
  };
}

