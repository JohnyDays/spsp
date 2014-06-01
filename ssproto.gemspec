require 'find'
template_files = []
Find.find('template/') { |e| template_files << e}
Gem::Specification.new do |s|
  s.name        = 'ssproto'
  s.version     = '1.0.6'
  s.add_runtime_dependency 'sass'
  s.add_runtime_dependency 'slim'
  s.add_runtime_dependency 'tilt'
  s.add_runtime_dependency 'filewatcher'
  s.date        = '2014-04-15'
  s.summary     = "Rapid slim prototyping"
  s.description = "Single page slim prototyping (use of sass and coffeescript is encouraged)"
  s.authors     = ["Johnydays"]
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/ssproto.rb","lib/slim/slim.rb"] + template_files
  s.executables << 'ssproto'
  s.homepage    = 'https://github.com/JohnyDays/spsp'
  s.license     = 'MIT'
end
