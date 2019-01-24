
require 'httparty'

class Kele
    include HTTParty

    BASE_URI = 'https://www.bloc.io/api/v1'



    def initialize(email, password)
        response = self.class.post("https://private-amnesiac-822888-blocapi.apiary-proxy.com/api/v1/sessions", body: { 'email': email, 'password': password })
        if response && response["auth_token"]
     @auth_token = response['auth_token']
     puts "#{email} is sucessfully in with auth_token #{@auth_token}"
   else
     puts "Login invalid"
   end
end

def get_me
    response = Kele.get("https://private-amnesiac-822888-blocapi.apiary-proxy.com/api/v1/users/me",
      headers: { "authorization" => @auth_token }
    )
    @user_info = JSON.parse(response.body)
  end


end
