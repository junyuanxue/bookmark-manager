require "sinatra/base"
require_relative "models/link.rb"

class BookmarkManager < Sinatra::Base
  get "/" do
    redirect "/links"
  end

  get "/links" do
    erb(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
