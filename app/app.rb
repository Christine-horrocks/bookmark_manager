require 'sinatra/base'
require_relative './models/link'

class BookMark < Sinatra::Base

get '/links' do
  @links = Link.all
  erb(:links)
end

  run! if app_file == $0
end