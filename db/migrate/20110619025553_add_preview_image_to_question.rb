class AddPreviewImageToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :preview_image, :string
  end

  def self.down
    remove_column :questions, :preview_image
  end
end
