class AddIsSponsorToSuggestions < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :is_sponsor, :boolean, :default => false
  end

  def self.down
    remove_column :suggestions, :is_sponsor
  end
end
