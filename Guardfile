require 'guard/guard'
# required to use the rails string singularize method
require 'active_support/inflector'

guard 'bundler' do
  watch('Gemfile')
end

module ::Guard
  class Migrate < ::Guard::Guard
    def initialize(watchers=[], options={})
      super

      @reset = true if options[:reset] == true
      @test_clone = true unless options[:test_clone] == false
      @run_on_start = true if options[:run_on_start] == true
      @rails_env = options[:rails_env]
      @annotate = true unless options[:annotate] == false
    end

    def bundler?
      @bundler ||= File.exist?("#{Dir.pwd}/Gemfile")
    end

    def run_on_start?
      !!@run_on_start
    end

    def test_clone?
      !!@test_clone
    end

    def reset?
      !!@reset
    end

    def annotate?
      !!@annotate
    end

    def rails_env
      @rails_env
    end

    # =================
    # = Guard methods =
    # =================

    # If one of those methods raise an exception, the Guard::GuardName instance
    # will be removed from the active guards.

    # Called once when Guard starts
    # Please override initialize method to init stuff
    def start
      self.migrate if self.run_on_start?
      self.annotate if self.run_on_start?
    end

    # Called on Ctrl-C signal (when Guard quits)
    def stop
      true
    end

    # Called on Ctrl-Z signal
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    def reload
      self.migrate if self.run_on_start?
      self.annotate if self.run_on_start?
    end

    # Called on Ctrl-/ signal
    # This method should be principally used for long action like running all specs/tests/...
    def run_all
      #self.migrate if self.run_on_start?
    end

    # Called on file(s) modifications
    def run_on_change(paths)
      self.migrate_changes(paths.map { |path| path.scan(%r{^db/migrate/(\d+).+\.rb}).flatten.first })
      self.annotate
    end

    def migrate_changes(paths = [])
     return if !self.reset? && paths.empty?
      system self.rake_string if self.reset?
      paths.each do |path|
        UI.info "Running #{self.rake_string(path)}"
        system self.rake_string(path)
      end
    end

    def annotate
      return if !self.annotate?
      UI.info "Running annotation..."
      system "bundle exec annotate --position after &"
    end

    def migrate
      UI.info "Running #{self.rake_string()}"
      system self.rake_string
    end

    def rake_string(path = nil)
      @rake_string = ''
      @rake_string += 'bundle exec ' if self.bundler?
      @rake_string += 'rake'
      @rake_string += ' db:migrate'
      @rake_string += ':reset' if self.reset?
      @rake_string += ":redo VERSION=#{path}" if !self.reset? && path && !path.empty?
      @rake_string += ' db:test:clone' if self.test_clone?
      @rake_string += " RAILS_ENV=#{self.rails_env}" if self.rails_env
      @rake_string
    end

  end
end

guard 'Migrate', :run_on_start => true do
  watch(%r{^db/migrate/(\d+).+\.rb})
end


# module ::Guard
#   class SunspotStarter < ::Guard::Guard
#     def start
#       puts 'Starting Sunspot/Solr'
#       system 'rake sunspot:solr:start &'
#       system 'rake sunspot:solr:start RAILS_ENV=test &'
#       true
#     end
# 
#   end
# end

# guard 'SunspotStarter' do
#   watch('Guardfile')
# end

# Rails Server
guard 'rails', :port => 3000, :timeout => 10, :server => :thin do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/.*})
end

#guard 'passenger' do
#  watch(/^lib\/.*\.rb$/)
#  watch(/^config\/.*\.rb$/)
#  watch('Gemfile')
#end

# spork guard must be initialized before rspec or cucumber guards
#guard 'spork', :wait => 20, :cucumber_env => {'RAILS_ENV' => 'cucumber'}, :rspec_env => {'RAILS_ENV' => 'test'} do
guard 'spork', :cucumber_env => false, :rspec_env => {'RAILS_ENV' => 'test'} do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb')

  # Watch factory-girl-rails factories
  #watch(%r{^spec/factories/.+\.rb})

  # if the Gemfile changes...
  watch('Gemfile')
end

guard 'rspec', :bundler => false, :version => 2, :all_on_start => false, :all_after_pass => false, :cli => "--color --format nested --fail-fast --drb --tag ~js" do
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/(.+)\.rb})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { "spec" }

  # Rails example
  watch('spec/spec_helper.rb')                       { "spec" }
  watch('config/routes.rb')                          { "spec/routing" }
  watch('app/controllers/application_controller.rb') { "spec/controllers" }
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^app/(.+)\.rb})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }

  # Run model spec if factory changes
  watch(%r{^spec/factories/(.+)\.rb}) { |m| "spec/models/#{m[1].singularize}_spec.rb" }


end

module ::Guard
  class GitStatus < ::Guard::Guard
    # Called on Ctrl-C signal (when Guard quits)
    def stop
      puts
      puts `git status`
      true
    end

  end
end

# guard 'annotate', :position => 'after', :routes => true, :tests => true, :run_at_start => false do
#   #watch('db/schema.rb')
# 
#   # Uncomment the following line if you also want to run annotate anytime
#   # a model file changes
#   #watch( 'app/models/**/*.rb' )
# 
#   # Uncomment the following line if you are running routes annotation
#   # with the ":routes => true" option
#   watch('config/routes.rb')
# end

guard 'GitStatus' do
  watch('Guardfile')
end

# module ::Guard
#   class SeedFu < ::Guard::Guard
#     def run_on_change(paths)
#       filter = paths.map { |path| path.scan(%r{^db/fixtures/(.+)\.rb}).flatten.first }.join(',')
#       cmd = "rake db:seed_fu FILTER=#{filter}"
#       puts "Running #{cmd}"
#       puts `#{cmd}`
#       puts "done."
#       #paths.each do |path|
#       #  name = path.scan(%r{^db/fixtures/(.+)\.rb}).flatten.first
#       #  puts "Running rake db:seed_fu:#{name}..."
#       #  `rake db:seed_fu:#{name}`
#       #end
#       #puts "done."
#       true
#     end
#   end
# end
# 
# guard 'SeedFu' do
#   watch(%r{^db/fixtures/.+\.rb})
# end
