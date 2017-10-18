require 'sinatra/base'
require_relative './models/link'

class BookMark < Sinatra::Base

get '/links' do
  @links = Link.all
  p @links
  erb(:links)
end

get '/links/new' do
  erb(:'links/new')
end

post '/links' do
  Link.create(title: params[:title], url: params[:url])
  redirect '/links'
end

  run! if app_file == $0
end
