require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

get('/user_index') do
  @surveys = Survey.all()
  erb(:user_index)
end

post('/surveys') do
  name = params.fetch('name')
  Survey.create({:name => name})
  redirect '/'
end

get('/surveys/:id') do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  @questions = @survey.questions()
  erb(:surveys)
end

get('/user_surveys/:id') do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  @questions = @survey.questions()
  erb(:user_surveys)
end

get('/surveys_edit/:id') do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  erb(:surveys_edit)
end

post('/answers') do
  answer = params.fetch("answer")
  question_id = params.fetch("question_id").to_i()
  Answer.create({:answer => answer, :question_id => question_id})
  url = "/questions/" + (question_id.to_s)
  redirect(url)
end

post('/questions') do
  name = params.fetch('name')
  survey_id = params.fetch('survey_id')
  @survey = Survey.find(survey_id)
  Question.create({:name_of_question => name, :survey_id => survey_id})
  redirect back
end

patch("/surveys/:id") do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  url = "/surveys/" + @survey.id().to_s()
  redirect(url)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:index)
end

get('/questions/:id') do
  id = params.fetch("id").to_i()
  @question = Question.find(id)
  @answers = @question.answers()
  erb(:questions_edit)
end

get('/user_questions/:id') do
  id = params.fetch("id").to_i()
  @question = Question.find(id)
  @answers = @question.answers()
  erb(:user_questions)
end

patch("/questions/:id") do
  name = params.fetch("name")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:name_of_question => name})
  url = "/surveys/" + @question.survey_id().to_s()
  redirect(url)
end

delete("/questions/:id") do
  @question = Question.find(params.fetch("id").to_i())
  @question.delete()
  @questions = Question.all()
  url = "/surveys/" + @question.survey_id().to_s()
  redirect(url)
end

post("/responses") do
  answer_id = params.fetch("answer_id")
  @answer = Answer.find(answer_id)
  @question = @answer.question()
  @response = Response.create({:answer_id => answer_id})
  url = "/user_surveys/" + @question.survey_id().to_s()
  redirect(url)
end

get('/answers') do
  @answers = Answer.all()
  erb(:answers)
end

get('/answers/:id') do
  answer_id = params.fetch("id").to_i()
  @answer = Answer.find(answer_id)
  answer = Answer.find(answer_id)
  @question = @answer.question()
  @responses = @question.answers().responses()
  erb(:answer_responses)
end
