class AddDescriptionToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :description, :text
  end

  def self.down
    remove_column :galleries, :description
  end
end
