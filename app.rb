require_relative 'lib/database_connection'
require_relative 'lib/artist_repository.rb'
require_relative 'lib/album_repository.rb'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artist_repository  = ArtistRepository.new
album_repository = AlbumRepository.new

artist_repository.all.each do |artist|
  p "#{artist.id} #{artist.name} #{artist.genre}"
end 

album_repository.all.each do |album|
  p "#{album.id} #{album.title} #{album.release_year} #{album.artist_id}"
end
