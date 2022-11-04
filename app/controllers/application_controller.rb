class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/games' do
    # get all the games from the database
    # return a JSON response with an array of all the game data
    game = Game.all.order(:title)
    game.to_json
  end


  get "/games/:id" do

    game = Game.find(params[:id])

    game.to_json(only: [:id, :title, :genre, :price],
       include: {reviews: {only: [:score, :comment], include: {user:{only: [:name]}}
       }})
  end

end
