require('spec_helper')


describe("Response") do
  describe("#hello") do
    it("will test to see chained classes in action") do
      test_survey = Survey.create({:name => "Test Survey"})
      test_question = Question.create({:name_of_question => "Test Question?", :survey_id => test_survey.id()})
      test_answer = Answer.create({:answer => "Test Answer", :question_id => test_question.id()})
      test_response = Response.create({:answer_id => test_answer.id()})
binding.pry
      expect(test_response.hello()).to(eq(hello))
    end
  end
end
