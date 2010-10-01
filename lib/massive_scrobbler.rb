$: << File.expand_path(File.dirname(__FILE__))

require 'massive_scrobbler/songs'
require 'massive_scrobbler/user'

module MassiveScrobbler

  VERSION = "0.0.1" #:nodoc:
  CONFIG_PATH = File.expand_path '~/.massive-scrobbler'


  def MassiveScrobbler.go!(args)
    s = MassiveScrobbler::Songs.new(args[:path])
    u = MassiveScrobbler::User.new(args[:verbose])

    s.songs.each do |song|
      mp3info = Mp3Info.open(song) do |mp3|
        { :length => mp3.length.to_i,
          :artist => mp3.tag.artist,
          :title  => mp3.tag.title,
          :album  => mp3.tag.album,
          :trackn => mp3.tag.tracknum }
      end

      u.scrobble(mp3info)
      if args[:delay] == 'real'
        delay = mp3info[:length]
      else
        begin
          delay = Float args[:delay]
        rescue
          delay = 0
        end
      end
      sleep(delay)
    end

  end

end
