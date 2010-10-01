$: << File.expand_path(File.dirname(__FILE__))

require 'massive_scrobbler/songs'
require 'massive_scrobbler/user'
require 'mp3info'

module MassiveScrobbler

  VERSION = "0.0.1" #:nodoc:
  CONFIG_PATH = File.expand_path '~/.massive-scrobbler'


  def MassiveScrobbler.go!(args)
    s = MassiveScrobbler::Songs.new(args[:path])
    u = MassiveScrobbler::User.new(args[:verbose])
    delay = begin
              Float args[:delay]
            rescue
              0.0
            end
    n_songs = s.songs.length

    s.songs.each_with_index do |song, i|
      mp3info = Mp3Info.open(song) do |mp3|
        { :length => mp3.length.to_i,
          :artist => mp3.tag.artist,
          :title  => mp3.tag.title,
          :album  => mp3.tag.album,
          :trackn => mp3.tag.tracknum }
      end

      eol = "\r"
      eol = "\n" if (i+1 == n_songs or args[:verbose])
      STDERR.print("Scrobbled #{i+1} of #{n_songs}#{eol}")
      STDERR.flush

      u.scrobble(mp3info)
      delay = mp3info[:length] if args[:delay] == 'real'
      sleep(delay)
    end
    puts "Done!"
  end

end
