class ChangeMusicModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :musics, :file_file_name
    remove_column :musics, :file_content_type
    remove_column :musics, :file_file_size
    add_column :musics, :music_file, :string
    add_column :musics, :external_link, :string
  end
end
