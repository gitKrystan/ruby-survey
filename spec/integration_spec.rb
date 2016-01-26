require "spec_helper"

Capybara.app = Sinatra::Application
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

feature "add a question path" do
  scenario "adds a question to a survey" do
    test_survey = create_test_survey
    visit('/')
    click_link('Test Survey')
    fill_in('question', :with => 'Test question?')
    click_button('Create Question')
    expect(page).to(have_content('Test question?'))
    expect(page).to(have_content('Manage Survey'))
  end
end
