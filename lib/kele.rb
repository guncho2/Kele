
require 'httparty'

class Kele
    include HTTParty

    BASE_URI = 'https://www.bloc.io/api/v1'



    def initialize(email, password)
        response = self.class.post("#{BASE_URI}/sessions", body: { 'email': email, 'password': password })
        raise 'Invalid email or password' if response.code == 404
    @auth_token = response["auth_token"]
end

def get_me
    response = self.class.post("#{BASE_URI}/users/me",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end


end
