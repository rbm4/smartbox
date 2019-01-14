class AddAttachmentFileToMusics < ActiveRecord::Migration[5.2]
  def self.up
    change_table :musics do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :musics, :file
  end
end
