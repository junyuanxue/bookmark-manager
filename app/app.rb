require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative 'models/data_mapper_setup'


class BookmarkManager < Sinatra::Base

  get '/' do
    redirect(:links)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/add_link' do
    erb(:add_link)
  end

  post '/add_link' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split(",").each do |tag_name|
      tag = Tag.create(name: tag_name)
      link.tags << tag
      link.save
    end
    redirect(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
