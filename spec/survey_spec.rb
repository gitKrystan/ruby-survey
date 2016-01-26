require 'spec_helper'

describe(Survey) do
  describe('#questions') do
    it ('returns all questions for a given survey') do
      test_survey = create_test_survey
      test_question = create_test_question(test_survey.id)
      expect(test_survey.questions()).to(eq([test_question]))
    end
  end

  describe('#capitalize') do
    it ('capitalizes the title before save') do
      test_survey = create_test_survey
      expect(test_survey.title()).to(eq("Test Survey"))
    end
  end
end
