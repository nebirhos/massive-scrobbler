$: << File.expand_path(File.dirname(__FILE__))

require 'massive_scrobbler/songs'
require 'massive_scrobbler/user'

module MassiveScrobbler

  VERSION = "0.0.2" #:nodoc:
  CONFIG_PATH = File.expand_path '~/.massive-scrobbler'


  def MassiveScrobbler.go!(args)
    s = MassiveScrobbler::Songs.new(args[:path])
    u = MassiveScrobbler::User.new(args[:verbose])
    delay = begin
              Float args[:delay]
            rescue
              0.0
            end

    s.each_song_with_index do |song, i|
      i += 1
      if song[:artist].nil?
          MassiveScrobbler.puts_status("Skipped song #{song[:path]}", true)
      else
        new_line = (i == s.length || args[:verbose])
        u.scrobble(song)
        MassiveScrobbler.puts_status("Scrobbled #{i} of #{s.length}", new_line)
        delay = song[:length] if args[:delay] == 'real'
        sleep(delay)
      end
    end

    MassiveScrobbler.puts_status("Done!", true)
  end

  def MassiveScrobbler.puts_status(string, new_line=nil)
    eol = "\r"
    eol = "\n" if new_line
    STDERR.print(string + eol)
    STDERR.flush
  end

end
