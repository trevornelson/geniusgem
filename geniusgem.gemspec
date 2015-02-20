Gem::Specification.new do |s|
  s.name        = 'geniusgem'
  s.version     = '0.0.0'
  s.date        = '2015-02-20'
  s.summary     = "A simple scraping gem"
  s.description = "Scrapes genius.com website for song details."
  s.authors     = ["Trevor Nelson", "Jeff Thomas", "Dan Asselin", "Max Rater"]
  s.email       = 'trevor.nelson1@gmail.com'
  s.files       = ["lib/geniusgem.rb"]
  s.homepage    =
    'http://rubygems.org/gems/geniusgem'
  s.license       = 'MIT'
  s.add_dependency 'nokogiri', '>= 1.6.5'
end
