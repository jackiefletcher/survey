class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name_of_question
      t.string :answer_to_question

      t.timestamps
    end
  end
end
