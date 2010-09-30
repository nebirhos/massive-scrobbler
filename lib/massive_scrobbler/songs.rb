module MassiveScrobbler

  class Songs
    KNOWN_TYPES = ['mp3']
    attr_reader :songs, :path

    def initialize(path)
      @path = File.expand_path(path)
      @songs = song_search
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
  end

end
