require 'spec_helper'

describe(Survey) do
  describe('#questions') do
    it ('returns all questions for a given survey') do
      test_survey = Survey.create(title: "Test Survey")
      test_question = Question.create({
        question: "Is this a test question?",
        survey_id: test_survey.id
        })
      expect(test_survey.questions()).to(eq([test_question]))
    end
  end
end
