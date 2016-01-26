ENV['RACK_ENV'] = 'test'
require 'capybara/rspec'
require "./app"
require "selenium-webdriver"
require 'launchy'

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end
end

Capybara.app = Sinatra::Application
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.current_driver = Capybara.javascript_driver
set(:show_exceptions, false)

feature "add a survey path" do
  scenario "creates a new survey and displays it to the user" do
    visit('/')
    fill_in('title', :with => 'test survey')
    click_button('Create Survey')
    expect(page).to(have_content('Test Survey'))
    expect(page).to(have_content('Manage Survey'))
    click_link('Survey Donkey')
    expect(page).to(have_content('Test Survey'))
    expect(page).to(have_content('New Survey'))
  end
end

feature "add a question path", :js => true do
  scenario "adds a question to a survey" do
    test_survey = create_test_survey
    visit('/')
    click_link('Test Survey')
    fill_in('question', :with => 'Test question?')
    fill_in('response1', :with => 'test response 1')
    click_button('+')
    fill_in('response2', :with => 'test response 2')
    click_button('Create Question')
    expect(page).to(have_content('Test question?'))
    expect(page).to(have_content('Manage Survey'))
    click_link('Test question?')
    expect(page).to(have_content('Test question?'))
    expect(page).to(have_content('test response 1'))
    expect(page).to(have_content('test response 2'))
  end
end

feature "update a survey" do
  scenario "allows a user to update a survey" do
    test_survey = create_test_survey
    test_question = create_test_question(test_survey.id)
    test_response = create_test_response(test_question.id)
    visit('/')
    click_link('Test Survey')
    click_button('expand-title-edit')
    fill_in('title', :with => 'new survey name')
    click_button('Update')
    expect(page).to(have_content('New Survey Name'))
    expect(page).to(have_content('Manage Survey'))
    click_link(test_question.question)
    click_button('expand-question-edit')
    fill_in('question', :with => 'New question text?')
    fill_in(test_response.id, :with => 'New answer text')
    click_button('Update')
    expect(page).to(have_content('New question text?'))
    expect(page).to(have_content('New answer text'))
  end
end
