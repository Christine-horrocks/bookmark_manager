ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookMark < Sinatra::Base

get '/links' do
  @links = Link.all
  @tags = Tag.all
  erb(:links)
end

get '/links/new' do
  erb(:'links/new')
end

post '/links' do
  link = Link.new(title: params[:title], url: params[:url])
  p link
  tag = Tag.first_or_create(tag: params[:tag])
  p tag
  link.tags << tag
  link.save
  redirect '/links'
end

  run! if app_file == $0
end
