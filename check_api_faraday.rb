require 'faraday'
require 'faraday_middleware'
require 'rubygems'
require 'json'

class TestAPI 

def method1
# make=Honda,model=All, year=2002
url = 'https://api.edmunds.com/api/vehicle/v2/honda?state=used&year=2002&view=basic&fmt=json&api_key=sejx8md9mkqnqzms6a9h89yt'


conn = Faraday.new(url: url) do |faraday|
  faraday.adapter Faraday.default_adapter
  faraday.response :json
end

response = conn.get '/'

data = JSON.parse(response.body)
p data

return data["models"][0]["name"]

end

def method2
# make=Honda, model=Accord, year=all
url = 'https://api.edmunds.com/api/vehicle/v2/honda/accord?state=new&view=basic&fmt=json&api_key=sejx8md9mkqnqzms6a9h89yt'
conn = Faraday.new(url: url) do |faraday|
  faraday.adapter Faraday.default_adapter
  faraday.response :json
end

response = conn.get '/'

data = JSON.parse(response.body)
p data
year = data["years"][1]["year"]
return year

end

def method3
# make=Honda, model=Accord, year=2014
url = 'https://api.edmunds.com/api/vehicle/v2/honda/accord?state=new&year=2014&view=basic&fmt=json&api_key=sejx8md9mkqnqzms6a9h89yt'
conn = Faraday.new(url: url) do |faraday|
  faraday.adapter Faraday.default_adapter
  faraday.response :json
end

response = conn.get '/'
data = JSON.parse(response.body)
p data

return data["name"]

end

end

object = TestAPI.new
message = object.method1
puts message

message = object.method3
puts message

message = object.method2
puts message