source 'https://rubygems.org'

gem 'berkshelf'
gem 'thor-foodcritic'

group :test do
  gem "chefspec"
  gem "foodcritic"
  gem "guard"
  gem "guard-rspec"
  gem "guard-kitchen"
  gem "ruby_gntp"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end
gem "test-kitchen", git: 'http://github.com/opscode/test-kitchen', branch: 'windows', :group => :integration
gem 'kitchen-vagrant', git: 'http://github.com/opscode/kitchen-vagrant', branch: 'master', :group => :integration
