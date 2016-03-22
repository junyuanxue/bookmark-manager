require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    erb :links
  end
end
