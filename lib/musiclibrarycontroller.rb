require 'pry'

class MusicLibraryController
attr_accessor :path, :musicimporter

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ''
  while input != 'exit'
   puts "Welcome to your music library!"
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To list all of your songs, enter 'list songs'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"
   input = gets.strip
  end

 end

def list_songs
  Song.all.sort_by{|s| s.name}.each_with_index {|a, i| puts "#{i+1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"}
end

def list_artists
  Artist.all.sort_by{|a| a.name}.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
end

def list_genres
  Genre.all.sort_by{|g| g.name}.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
end

def list_songs_by_artist
  artist = gets.chomp
  puts "Please enter the name of an artist:"
  martist = Artist.find_or_create_by_name(artist)
    if martist
      martist.list_songs
    end
    binding.pry
end

def list_songs_by_genre
  genre = gets.chomp
  puts "Please enter the name of a genre:"


end

def play_song
  song = gets.strip.to_i
  puts "Which song number would you like to play?"
  puts "Playing #{song} by #{song}"
  #  binding.pry
end

end
