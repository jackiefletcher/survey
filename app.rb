require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
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

get('/surveys_edit/:id') do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  erb(:surveys_edit)
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
