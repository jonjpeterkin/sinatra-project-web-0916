#require 'rack-flash'

class UsersController < ApplicationController

  get "/users/?" do
    @loc = "users"
    @users = User.all
    erb :'users/index.html'
  end

  get "/users/new/?" do
    erb :'users/new.html'
  end

  get "/users/signin/?" do
    erb :'users/signin.html'
  end

  post "/users/signin/?" do
    User.find_by(name: params[:username]).sign_in
    flash[:message] = "Signed in as #{User.signed_in.name}."
    redirect to "/users/#{User.signed_in.id}"
  end

  post "/users/?" do
    @user = User.find_or_create_by(name: params[:user][:name])
    @user.sign_in
    flash[:message] = "Signed in as #{User.signed_in.name}."
    redirect to "/users/#{@user.id}"
  end

  get "/users/:id/?" do
    @user = User.find(params[:id])
    erb :'/users/show.html'
  end

  get "/users/:id/edit/?" do
    erb :'/users/edit.html' if User.signed_in && User.signed_in.id == params[:id].to_i 
    flash[:message] = "You must be signed in to edit your profile."
    redirect back
  end

  patch "/users/:id/?" do
    User.find(params[:id]).update(params[:user])
    flash[:message] = "Profile updated."
    redirect to "/users/#{params[:id]}"
  end

  delete "/users/:id/?" do
    User.find(params[:id]).delete
    flash[:message] = "Profile deleted."
    redirect to "/users"
  end
end
