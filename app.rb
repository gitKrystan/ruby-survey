require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload('./**/*.rb')
require 'pg'
require './lib/survey'
require './lib/question'
require './lib/response'

get '/' do
  @surveys = Survey.all()

  erb :index
end

post '/surveys' do
  title = params[:title]
  survey = Survey.create(title: title)

  redirect("/surveys/#{survey.id}")
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions

  erb :survey_form
end

post '/surveys/:id/questions' do
  survey = Survey.find(params[:id])
  survey.questions.create(question: params[:question])

  redirect("/surveys/#{survey.id}")
end
