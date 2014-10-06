module ApplicationHelper


def apple_lookup id
  "https://itunes.apple.com/lookup?id=#{id}"
end


def app_data_from_apple id
  return object = JSON.parse(open("https://itunes.apple.com/lookup?id=#{id}").read)['results']
end

def app_price id
  app(id).first['price']
end


end
