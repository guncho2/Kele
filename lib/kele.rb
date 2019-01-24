
require 'httparty'

class Kele
    include HTTParty

    BASE_URI = 'https://www.bloc.io/api/v1'

    def initialize(email, password)
        response = self.class.post("https://www.bloc.io/api/v1/sessions", body: { 'antblessing@gmail.com': email, 'password': password })
        if response && response["auth_token"]
     @auth_token = response["auth_token"]
     puts "#{email} is sucessfully in with auth_token #{@auth_token}"
   else
     puts "Login invalid"
   end
 end


end
