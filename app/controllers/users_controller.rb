class UsersController < ApplicationController

  get "/users" do
    @users = User.all
    erb :'users/index.html'
  end

  get "/users/new" do
    erb :'users/new.html'
  end

  post "/users" do
    @user = User.find_or_create_by(name: params[:user][:name])
    redirect to "/users/#{@user.id}"
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'/users/show.html'
  end
end
