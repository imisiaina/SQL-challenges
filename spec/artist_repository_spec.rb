# repo = ArtistRepository.new

# students = repo.all

# artist.length # =>  2

# artist[0].id # =>  1
# artist[0].name # =>  'David'
# artist[0].cohort_name # =>  'April 2022'

require_relative '../lib/artist_repository.rb'

RSpec.describe 'ArtistRepository' do
  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_artists_table
  end
  
  it "returns the list of artists" do
      repo = ArtistRepository.new
      artists = repo.all 
      expect(artists.length).to eq 2
      expect(artists[0].id).to eq "1"
      expect(artists[0].name).to eq 'Pop Smoke'
  end

  it "returns a single Artist object" do
    repo = ArtistRepository.new
    artist = repo.find(1)
    expect(artist.name).to eq "Pop Smoke"
    expect(artist.genre).to eq "Trap"
  end       
end