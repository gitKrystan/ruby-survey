ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'capybara'
require 'survey'
require 'question'
require 'response'

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Question.all().each() do |question|
      question.destroy()
    end
    Response.all().each() do |response|
      response.destroy()
    end
  end
end
