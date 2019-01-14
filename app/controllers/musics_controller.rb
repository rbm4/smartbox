class MusicsController < ApplicationController
  def new
    @music = Music.new
  end

  def create
    music = Music.new(music_params)

    p music
    if music.save
      p "Successfully added new music!"
      p music.music_file.url # => '/url/to/file.png'
      p music.music_file.current_path # => 'path/to/file.png'
      p music.music_file_identifier # => 'file.png'
      redirect_to root_path
    else
      flash[:alert] = "Error adding new photo!"
      render :new
    end
  end

  def player
    @musics = Music.all
  end

  def music_params
    params.require(:music).permit(:title,:source,:music_file)
  end
end
