class BookmarkManager < Sinatra::Base
  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendRecoverLink.call(user)
    end
    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    session[:token] = params[:token]
    user = User.find_by_valid_token(params[:token])
    if user
      erb :'users/reset_password'
    else
      'Your token has expired'
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(session[:token])
    if user.update(password: params[:password],
                password_confirmation: params[:password_confirmation])
       redirect '/sessions/new'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/reset_password'
    end
  end
end
