# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{massive-scrobbler}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["nebirhos"]
  s.cert_chain = ["/home/istvan/Interzona/Dropbox/Doc/gemcert/gem-public_cert.pem"]
  s.date = %q{2010-10-01}
  s.default_executable = %q{massive-scrobbler}
  s.description = %q{Hack your LastFM account with hundreds of scrobblings in just few minutes :)}
  s.email = %q{nebirhos@aol.com}
  s.executables = ["massive-scrobbler"]
  s.extra_rdoc_files = ["README.rdoc", "bin/massive-scrobbler", "lib/massive_scrobbler.rb", "lib/massive_scrobbler/songs.rb", "lib/massive_scrobbler/user.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "bin/massive-scrobbler", "lib/massive_scrobbler.rb", "lib/massive_scrobbler/songs.rb", "lib/massive_scrobbler/user.rb", "massive-scrobbler.gemspec"]
  s.homepage = %q{http://github.com/nebirhos/massive-scrobbler}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Massive-scrobbler", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{massive-scrobbler}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/home/istvan/Interzona/Dropbox/Doc/gemcert/gem-private_key.pem}
  s.summary = %q{Hack your LastFM account with hundreds of scrobblings in just few minutes :)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rockstar>, [">= 0.4.2"])
      s.add_runtime_dependency(%q<ruby-mp3info>, [">= 0.6.13"])
      s.add_runtime_dependency(%q<choice>, [">= 0.1.4"])
    else
      s.add_dependency(%q<rockstar>, [">= 0.4.2"])
      s.add_dependency(%q<ruby-mp3info>, [">= 0.6.13"])
      s.add_dependency(%q<choice>, [">= 0.1.4"])
    end
  else
    s.add_dependency(%q<rockstar>, [">= 0.4.2"])
    s.add_dependency(%q<ruby-mp3info>, [">= 0.6.13"])
    s.add_dependency(%q<choice>, [">= 0.1.4"])
  end
end
