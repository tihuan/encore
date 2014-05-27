class SongsController < ApplicationController
  def create
    artist = Artist.find(params[:artist_id])
    concert = Concert.find(params[:concert_id])
    song = Song.find_by(title: params[:song], artist_id: artist.id)
    concert_song = concert.concert_songs.find_by(song_id: song.id)
    add_video(params[:song_id], concert_song)
    render text: "Song added!"
  end

  private
  def add_video(identifier, concert_song)
    video = Video.where(identifier: identifier).first_or_initialize
    video.concert_song_id = concert_song.id
    video.save!
  end
end
