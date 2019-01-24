
require 'httparty'

class Kele
    include HTTParty

    BASE_URI = 'https://www.bloc.io/api/v1'

    def initialize(email, password)
        response = self.class.post("https://private-amnesiac-822888-blocapi.apiary-proxy.com/api/v1/sessions", body: { 'email': email, 'password': password })
        if response && response["auth_token"]
     @auth_token = response["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiMGY2ZTg2YzE2YTYxNDg0MDk1MmE3ZjgxZTlkNmQ0OGUiLCJ1c2VyX2lkIjoyMzk5ODg2LCJuYW1lIjoiRWR1YXJkbyBMb3dlbnNvaG4ifQ.rX65Nwcpwl-CRSyjGKkPjSm6puoA6aNqio3p7y-Y0qw"]
     puts "#{email} is sucessfully in with auth_token #{@auth_token}"
   else
     puts "Login invalid"
   end
 end


end
