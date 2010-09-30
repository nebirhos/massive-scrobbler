require 'yaml'

module MassiveScrobbler

  class User
    attr_reader :user, :password

    def initialize
      if File.exists?(CONFIG_PATH)
        load_user
      else
        puts "Hey! this seems the first time you launch this script"
        puts "In order to submit your tracks to LastFM, you have to login."
        puts "This info will be stored in ~/.massive-scrobbler"
        puts "Username:"
        @user = gets.chomp
        puts "Password:"
        @password = gets.chomp
        create_user(username, password)
      end
    end

    def create_user(user, password)
      info = {:user => user, :password => password}
      File.open(CONFIG_PATH, 'w') do |conf|
        conf.write info.to_yaml
      end
    end

    def load_user
      info = {}
      File.open(CONFIG_PATH) do |conf|
        info = YAML::load(conf.read)
      end
      @user = info[:user]
      @password = info[:password]
    end

  end
end
