class MusicsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:clearAnPlayNext]
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
      p music.external_link # => 'file.png'
      redirect_to root_path
    else
      flash[:alert] = "Error adding new photo!"
      render :new
    end
  end

  def player
    @music = Music.last
    p @music
  end

  def clearAnPlayNext
    @last = Music.find(params[:id])
    @last.remove_music_file!
    @last.save
    @music = Music.last
    p @music.music_file.url
  end

  def music_params
    params.require(:music).permit(:title,:source,:music_file,:external_link)
  end
end
