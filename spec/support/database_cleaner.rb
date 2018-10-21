RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end
  
    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end
  
    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end
  
    config.before(:each) do
      DatabaseCleaner.start
    end
  
    #config.after(:each) do
    config.after(:suite) do
      DatabaseCleaner.clean
    end

    # config.before(:suite) do
    #   DatabaseCleaner.strategy = :transaction
    #   DatabaseCleaner.clean_with(:truncation)
    #   DatabaseCleaner.start
    #   DatabaseCleaner.clean
    # end
  
    # config.before(:each) do
    #   DatabaseCleaner.clean
    # end
  
    # config.after(:each) do
    #   DatabaseCleaner.clean
    # end
  
    # config.after(:suite) do
    #   DatabaseCleaner.clean_with(:truncation)
    # end
end