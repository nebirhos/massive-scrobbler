$: << File.expand_path(File.dirname(__FILE__))

require 'massive_scrobbler/songs'
require 'massive_scrobbler/user'

module MassiveScrobbler

  VERSION = "0.0.1" #:nodoc:
  CONFIG_PATH = File.expand_path '~/.massive-scrobbler'

end
