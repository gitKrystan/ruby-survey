ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'survey'
require 'question'
require 'response'

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end
end

def create_test_survey
  Survey.create(title: "test survey")
end

def create_test_question(survey_id)
  Question.create({
    question: "Is this a test question?",
    survey_id: survey_id
    })
end

def create_test_response(question_id)
  Response.create({
    response: "test response",
    question_id: question_id
    })
end
