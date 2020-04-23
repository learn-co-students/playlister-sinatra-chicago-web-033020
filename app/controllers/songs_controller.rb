require 'rack-flash'

class SongsController < ApplicationController

    use Rack::Flash

    # displays all songs
    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    post '/songs' do
        p params
        
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]

        @song.save

        flash[:message] = "Successfully created song."
        redirect to "/songs/#{ @song.slug }"
    end

end