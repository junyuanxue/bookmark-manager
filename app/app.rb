require "sinatra/base"
require_relative "models/link.rb"
require "tilt/erb"

class BookmarkManager < Sinatra::Base
  get "/" do
    redirect "/links"
  end

  get "/links" do
    @links = Link.all
    erb :"links/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
