
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    author = params["gossip_author"]
    content = params["gossip_content"]
    Gossip.new(author, content).save
    #récupères les données soumises par l'utilisateur et tu peux les passer à ton objet Gossip
    redirect '/'
  end


  # get '/gossips/new/:id' do 
  #   erb :show
  # end
  # post '/gossips/new/:id'
  #   gossip_id = params["id"]
  #   gossip_id.find
  #   redirect'/'
  # end
  get '/gossips/:id' do
    gossip_id = params["id"]
    @gossip = Gossip.find(gossip_id)  # Utilise la méthode find
    erb :show  # Affiche la vue 'show' pour ce gossip
  end
  

end

# ASTUCE: par ailleurs que "dans le doute, mets des puts partout" : ça te permet de comprendre comment marche un programme (et donc le débugger).