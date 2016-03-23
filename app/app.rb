ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    redirect '/links'
  end

  get '/links' do
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
    user = User.new(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       confirm_password: params[:confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:notice] = 'Sorry, your passwords did not match'
      erb :"/new_user"
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
