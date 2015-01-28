class AddRemoveColumnsQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :answer_to_question, :string

    add_column :questions, :survey_id, :integer
  end
end
