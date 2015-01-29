class AddJoinTable < ActiveRecord::Migration
  def change
    create_table :answers_responses do |t|
      t.integer :answer_id
      t.integer :response_id
    end
  end
end
