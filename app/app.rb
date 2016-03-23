ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @name = User.last.name if User.last
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(", ").each do |individual_tag|
      tag = Tag.first_or_create(name: individual_tag)
      link.tags << tag
      link.save
    end
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :"/links/index"
  end

  get '/new_user' do
    erb :new_user
  end

  post '/user' do
    user = User.create(name: params[:name], email: params[:email])
    user.password params[:password]
    user.save
    p user
    redirect '/links'
  end

  run! if app_file == $0
end
