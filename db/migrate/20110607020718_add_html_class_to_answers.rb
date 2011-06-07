class AddHtmlClassToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :html_class, :string
  end

  def self.down
    remove_column :answers, :html_class
  end
end
