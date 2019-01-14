class Music < ApplicationRecord
  mount_uploader :music_file, MusicUploader
end
