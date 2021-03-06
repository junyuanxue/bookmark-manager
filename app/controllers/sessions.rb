class BookmarkManager < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id]=user.id
      redirect '/links'
    else
      flash.now[:errors] = ["Incorrect email or password"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Thanks for using Bookmark Manager'
    redirect '/links'
  end
end
