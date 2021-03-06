Gem::Specification.new do |s|
  s.name        = 'maildrop'
  s.version     = '0.1.2'
  s.date        = '2017-04-24'
  s.summary     = 'Ruby interface to MailDrop.'
  s.description = 'Ruby interface to MailDrop for quick, disposable mailboxes.'
  s.authors     = ['Melvin Lammerts']
  s.email       = 'hi@melvin.sh'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    =
    'https://github.com/melvinsh/maildrop'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.0.0'
  s.add_runtime_dependency 'mail', ['~> 2.6', '>= 2.6.4']
  s.add_runtime_dependency 'http', ['~> 2.2', '>= 2.2.1']
end
