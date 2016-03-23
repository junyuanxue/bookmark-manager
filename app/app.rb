require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello world!'
  end

  run! if app_file == $0
end
