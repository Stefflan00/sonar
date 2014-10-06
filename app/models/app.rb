class App < ActiveRecord::Base

def app_data_from_apple id
  return object = JSON.parse(open("https://itunes.apple.com/lookup?id=#{id}").read)['results']
end


def rating_to_image
  rating = self.rating
  
end

end
