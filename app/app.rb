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
  tag = Tag.first_or_create(tag: params[:tag])
  link.tags << tag
  link.save
  redirect '/links'
end

get '/tags/:tag' do
  tag = Tag.first(tag: params[:tag])
  @links = tag ? tag.links : []
  erb :'links/index'
end

  run! if app_file == $0
end
