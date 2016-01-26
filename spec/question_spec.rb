require 'spec_helper'

describe(Question) do
  describe('#questions') do
    it ('returns all questions for a given survey') do
      test_survey = create_test_survey
      test_question = create_test_question(test_survey.id)
      test_response = create_test_response(test_question.id)
      expect(test_question.responses()).to(eq([test_response]))
    end
  end
end
