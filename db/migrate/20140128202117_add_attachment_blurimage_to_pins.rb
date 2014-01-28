class AddAttachmentBlurimageToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :blurimage
    end
  end

  def self.down
    drop_attached_file :pins, :blurimage
  end
end
