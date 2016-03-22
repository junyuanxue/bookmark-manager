require "sinatra/base"
require_relative "data_mapper_setup"
require "tilt/erb"

class BookmarkManager < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  get "/" do
    redirect "/links"
  end

  get "/links/new" do
    erb :"links/new"
  end

  post "/links" do
    link = Link.create(title: params[:title], url: params[:url])
    link.tags << Tag.create(name: params[:tags])
    link.save
    redirect "/links"
  end

  get "/links" do
    @links = Link.all
    erb :"links/index"
  end

  get "/tags/:name" do
    tag = Tag.first(name: params[:name])
    tag ? @links = tag.links : @links = []
    erb :"links/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
