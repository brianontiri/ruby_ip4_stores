ENV['RACK_ENV'] = 'test'

  require("bundler/setup")
  Bundler.require(:default, :test)
  set(:root, Dir.pwd())

  require('capybara/rspec')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)
  require('./app')
#clears data after save
  RSpec.configure do |config|
    config.after(:each) do
      Store.all().each() do |store|
        store.destroy()
      end
    Brand.all().each() do |brand|
        brand.destroy()
      end
    end
  end
