require 'httparty'
require 'json'
require './lib/roadmap'
module Roadmap
  include HTTParty


  BASE_URI = 'https://www.bloc.io/api/v1'

  #"chain_id"=>6823
  def get_roadmap(chain_id)
    response = self.class.get("#{BASE_URI}/roadmaps/#{chain_id}",
       headers: { "authorization" => @auth_token }
     )
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{BASE_URI}/checkpoints/#{checkpoint_id}",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end
end
