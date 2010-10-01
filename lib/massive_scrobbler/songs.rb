require 'mp3info'

module MassiveScrobbler

  class Songs
    KNOWN_TYPES = ['mp3']
    attr_reader :songs, :path, :length

    def initialize(path)
      @path = File.expand_path(path)
      @songs = song_search
      @length = @songs.length
    end

    def song_search(path=@path)
      Dir.entries(path).collect do |entry|
        full_path = File.expand_path(entry, path)
        next if entry == '.'
        next if entry == '..'
        if File.directory? full_path
          song_search(full_path)
        else
          types = KNOWN_TYPES.collect{|t| "\\.#{t}"}.join('|')
          next unless entry =~ /(#{types})$/i
          full_path
        end
      end.flatten.compact
    end

    def each_song_with_index
      @songs.each_with_index do |song, i|
        mp3info = Mp3Info.open(song) do |mp3|
          { :length => mp3.length.to_i,
            :artist => mp3.tag.artist,
            :title  => mp3.tag.title,
            :album  => mp3.tag.album,
            :trackn => mp3.tag.tracknum }
        end
        mp3info[:length] = 31  if mp3info[:length] <= 30
        mp3info[:title] ||= File.basename(song)
        mp3info[:path] = song
        yield mp3info, i
      end
    end
  end

end
