require_relative '../lib/artist.rb'

class ArtistRepository
  def all
    result_set = DatabaseConnection.exec_params('SELECT id, name, genre FROM artists;', [])
    artists = []
    result_set.each { |record| 
        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']
        artists << artist
    }
      return artists
  end

  def find(id)
   
    # The placeholder $1 is a "parameter" of the SQL query.
    # It needs to be matched to the corresponding element
    # of the array given in second argument to exec_params.
    #
    # (If we needed more parameters, we would call them $2, $3...
    # and would need the same number of values in the params array).
    sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    # (The code now needs to convert the result to a
    # Student object and return it)
    record = result_set[0]
    artist = Artist.new
    artist.id = record['id']
    artist.name = record['name']
    artist.genre = record['genre']

    return artist
  end
    
  
end
