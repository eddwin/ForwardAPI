require 'sinatra'
require 'json'
require_relative 'model/load'
class PowerAPI < Sinatra::Base

  configure :production, :development do
    enable :logging
  end

  get '/' do
    'Hello, Im up and running!'
  end

  post '/loads' do
    content_type :json
    body = request.body.read
    logger.info body
    time = Time.now
    begin
      req = JSON.parse(body)
      logger.info req
    rescue Exception => e
      puts e.message
      halt 400
    end
    req
  end


end
