# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{massive-scrobbler}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["nebirhos"]
  s.date = %q{2010-09-22}
  s.default_executable = %q{massive-scrobbler}
  s.description = %q{hack your LastFM account with thousands of scrobblings in just few seconds :)}
  s.email = %q{nebirhos@aol.com}
  s.executables = ["massive-scrobbler"]
  s.extra_rdoc_files = ["README.rdoc", "bin/massive-scrobbler", "lib/songs.rb"]
  s.files = ["README.rdoc", "Rakefile", "bin/massive-scrobbler", "lib/songs.rb", "Manifest", "massive-scrobbler.gemspec"]
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Massive-scrobbler", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{massive-scrobbler}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{hack your LastFM account with thousands of scrobblings in just few seconds :)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<scrobbler>, [">= 0.2.3"])
      s.add_runtime_dependency(%q<ruby-mp3info>, [">= 0.6.13"])
      s.add_runtime_dependency(%q<choice>, [">= 0.1.4"])
    else
      s.add_dependency(%q<scrobbler>, [">= 0.2.3"])
      s.add_dependency(%q<ruby-mp3info>, [">= 0.6.13"])
      s.add_dependency(%q<choice>, [">= 0.1.4"])
    end
  else
    s.add_dependency(%q<scrobbler>, [">= 0.2.3"])
    s.add_dependency(%q<ruby-mp3info>, [">= 0.6.13"])
    s.add_dependency(%q<choice>, [">= 0.1.4"])
  end
end
