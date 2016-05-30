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
    begin
      req = JSON.parse(request.body.read)
      logger.info req
    rescue
      halt 400
    end
    load = Load.new
    load.hourly_loads = req['loads'].to_json
    load.time = Time.now.to_f

    if load.save
      status 201
    end

  end


end
