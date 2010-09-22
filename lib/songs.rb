class Songs

  def Songs.mp3_search(path)
    Dir.entries(path).collect do |entry|
      full_entry = File.expand_path(entry, path)
      next if entry == '.'
      next if entry == '..'
      if File.directory? full_entry
        mp3_search(full_entry)
      else
        next unless entry =~ /\.mp3$/i
        full_entry
      end
    end.flatten.compact
  end

end
