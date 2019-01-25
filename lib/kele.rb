
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
    response = self.class.get("#{BASE_URI}/users/me",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end

  # def get_mentor_availability(mentor_id)
  #     # caila's mentor id 2348651
  #     response = self.class.get("https://private-amnesiac-822888-blocapi.apiary-proxy.com/api/v1/mentors/id/student_availability", headers: { "authorization" => @auth_token }).to_a
  #     available = []
  #     response.each do |timeslot|
  #       if timeslot["booked"] == nil
  #         available.push(timeslot)
  #       end
  #     end
  #     puts available
  #   end

  def get_mentor_availability(mentor_id)
    response = self.class.get("#{BASE_URI}/mentors/#{mentor_id}/student_availability",
      headers: { "authorization" => @auth_token }
    )
    # @mentor_availability = JSON.parse(response.body)
     JSON.parse(response.body)
  end

end
