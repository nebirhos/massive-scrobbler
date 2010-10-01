require 'rubygems' if RUBY_VERSION < '1.9'
require 'rake'
require 'echoe'
$:.unshift( File.dirname( __FILE__ ) + '/lib' )
require 'massive_scrobbler'

Echoe.new('massive-scrobbler', MassiveScrobbler::VERSION) do |p|
  p.description     = "Hack your LastFM account with hundreds of scrobblings in just few minutes :)"
  p.url             = "http://github.com/nebirhos/massive-scrobbler"
  p.author          = 'nebirhos'
  p.email           = "nebirhos@aol.com"
  p.extra_deps      = [['rockstar', '>=0.4.2'], ['ruby-mp3info', '>=0.6.13'], ['choice', '>=0.1.4']]
end
