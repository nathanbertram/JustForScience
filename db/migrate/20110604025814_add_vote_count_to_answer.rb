class AddVoteCountToAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :vote_count, :integer, :default => 0
  end

  def self.down
    remove_column :answers, :vote_count
  end
end
