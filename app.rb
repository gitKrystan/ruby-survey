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

  redirect("/survey/#{survey.id}")
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])

  erb :survey_form
end
