class CreateResponseTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_id

      t.timestamps
    end
  end
end
