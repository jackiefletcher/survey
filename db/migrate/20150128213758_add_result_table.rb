class AddResultTable < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
