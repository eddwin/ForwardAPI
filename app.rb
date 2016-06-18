require 'sinatra'
require 'json'
require 'httparty'

class PowerAPI < Sinatra::Base

  configure :production, :development do
    enable :logging
  end

  get '/' do
    'Hello, Im up and running!'
  end

  post '/' do

    url = 'http://192.168.0.103:7778/acc'
    HTTParty.post(url,request)

  end


end
