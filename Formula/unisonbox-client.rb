class UnisonboxClient< Formula
  homepage 'https://github.com/thecontinium/homebrew-unisonbox/'
  url 'https://github.com/thecontinium/homebrew-unisonbox.git'
  version '0.0.6'

  skip_clean 'bin'

  depends_on "unison"
  
  def install
  end

  def caveats; <<-EOS.undent
    Edit the plist file with correct settings. Make sure the unison version >= 2.48.1
    EOS
  end


  #plist_options :startup => true

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Disabled</key>
      <false/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/ssh</string>
        <string>server-user@server-ip</string>
        <string>touch</string>
        <string>UnisonBox/.clientchange</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>StandardErrorPath</key>
      <string>/tmp/#{plist_name}.err</string>
      <key>StandardOutPath</key>
      <string>/tmp/#{plist_name}.out</string>
      <key>WatchPaths</key>
      <array>
        <string>/Users/client-user/UnisonBox</string>
      </array>
    </dict>
    </plist>
    EOS
  end
end
