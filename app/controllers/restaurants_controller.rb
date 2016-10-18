class RestaurantsController < ApplicationController

  get "/restaurants" do
    @loc = "restaurants"
    @restaurants = Restaurant.all
    erb :'restaurants/index.html'
  end

  get "/restaurants/new" do
    erb :'restaurants/new.html'
  end

  post "/restaurants" do
    @restaurant = Restaurant.find_or_create_by(params[:restaurant])
    @restaurant.user_ids
    redirect to "/restaurants/#{@restaurant.id}"
  end

  get "/restaurants/:id" do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show.html'
  end


end
