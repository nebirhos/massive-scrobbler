require 'yaml'

module MassiveScrobbler

  class User
    attr_reader :user

    def initialize(verbose=false)
      @verbose = verbose
      if File.exists?(CONFIG_PATH)
        load
        authenticate
      else
        puts "Hey! This seems the first time you launch this script."
        puts "In order to submit your tracks to LastFM, you have to login."
        puts "Please type your username and password (these will be stored in ~/.massive-scrobbler)."
        prompt_for_credentials
        while @user.empty? or @password.empty? or !authenticate
          puts "Invalid login! Retry"
          prompt_for_credentials
        end
        save
      end
    end

    def prompt_for_credentials
      puts "Username:"
      @user = gets.chomp
      puts "Password:"
      @password = gets.chomp
    end

    def save
      info = {:user => @user, :password => @password}
      File.open(CONFIG_PATH, 'w') do |conf|
        conf.write info.to_yaml
      end
    end

    def load
      info = {}
      File.open(CONFIG_PATH) do |conf|
        info = YAML::load(conf.read)
      end
      @user, @password = info[:user], info[:password]
    end

    def authenticate
      begin
        @auth = Scrobbler::SimpleAuth.new(:user => @user, :password => @password)
        @auth.handshake!
        if @verbose
          puts "Auth Status: #{@auth.status}"
          puts "Session ID: #{@auth.session_id}"
          puts "Now Playing URL: #{@auth.now_playing_url}"
          puts "Submission URL: #{@auth.submission_url}"
        end
        true
      rescue BadAuthError
        nil
      end
    end

    def scrobble(song)
      scrobble = Scrobbler::Scrobble.new(:session_id => @auth.session_id,
                                         :submission_url => @auth.submission_url,
                                         :artist => song[:artist],
                                         :track => song[:title],
                                         :album => song[:album],
                                         :time => Time.new,
                                         :length => song[:length],
                                         :track_number => song[:trackn])
      scrobble.submit!
      if @verbose
        puts "#{song[:artist]} - #{song[:title]}: #{scrobble.status}"
      end
    end

  end
end
