class AddQa < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :text
      t.timestamps
    end
    
    create_table :answers do |t|
      t.integer :question_id
      t.string :text
      t.timestamps
    end
    
    add_index :answers, :question_id
  end

  def self.down
    drop_table :questions
    drop_table :answers
  end
end
