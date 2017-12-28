class WelcomeController < ApplicationController
  require 'smile'
  
  def index
    
    # my_nick = ENV['SMUGMUG_NICKNAME']
    # my_pass = ENV['SMUGMUG_PASSWORD']
    # smug = Smile.auth( my_nick, my_pass )
    # album = Smile::Album.find(:album_id => "21511473", :album_key => "L25jTF")
    # @photos = album.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end
end
