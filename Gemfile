source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'  
  gem 'font-awesome-sass-rails'  
end

gem 'jquery-rails'

gem 'validates_timeliness', '~> 3.0.2'
gem 'carmen'
gem 'paperclip'
gem 'kaminari'
gem 'devise'
gem 'cancan'
gem 'simple_form'
gem 'redcarpet'
gem 'thin'
gem "friendly_id", "~> 4.0.1"
gem 'heroku'

group :production do
  gem 'newrelic_rpm'  
  gem 'airbrake'
end

group :development, :test do

	gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'rb-readline'
	gem 'growl'#, :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard', '>= 0.4.0'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork' 
  gem 'guard-bundler'
  gem 'guard-annotate'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'  
  gem 'database_cleaner'
  gem 'spork', '~> 0.9.0.rc'  
  gem 'mocha'
  gem 'email_spec'
  gem 'delorean'
  gem 'vcr'
  gem 'fakeweb'  
end

group :development do
	gem 'rails3-generators'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'libnotify', :require => false
  gem 'rb-inotify', :require => false
end
