require "sinatra/base"
require_relative "models/link.rb"
require "tilt/erb"

class BookmarkManager < Sinatra::Base
  get "/" do
    redirect "/links"
  end

  get "/links/new" do
    erb :"links/new_link"
  end

  post "/links" do
    @title = params[:title]
    @url = params[:url]
    Link.create(title: @title, url: @url)
    redirect "/links"
  end

  get "/links" do
    @links = Link.all
    erb :"links/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
