class UnisonboxServer< Formula
  homepage 'https://github.com/thecontinium/homebrew-unisonbox/'
  url 'https://github.com/thecontinium/homebrew-unisonbox.git'
  version '0.0.8'

  skip_clean 'bin'


  #depends_on "unison"
  depends_on "terminal-notifier"
  
  def install
    bin.install 'unisonbox-server'
    prefix.install 'unisonbox.prf'
  end

  def caveats; <<-EOS.undent
    Edit the plist file with correct settings, and mkdir -p ~/.unison ; cp  #{prefix}/unisonbox.prf ~/.unison.  Make sure the unison version >= 2.48.1
    EOS
  end


  #plist_options :startup => true

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>AbandonProcessGroup</key>
      <true/>
      <key>Disabled</key>
      <false/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/local/bin/unisonbox-server</string>
        <string>unisonbox.prf</string>
        <string>client-user</string>
        <string>server-ip</string>
        <string>notification-email</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>StandardErrorPath</key>
      <string>/tmp/#{plist_name}.err</string>
      <key>StandardOutPath</key>
      <string>/tmp/#{plist_name}.out</string>
      <key>WatchPaths</key>
      <array>
        <string>/Users/server-user/UnisonBox</string>
      </array>
    </dict>
    </plist>
    EOS
  end
end
