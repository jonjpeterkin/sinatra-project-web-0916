#require "rack-flash"

class RestaurantsController < ApplicationController

  get "/restaurants/?" do
    @loc = "restaurants"
    @restaurants = Restaurant.all
    erb :'restaurants/index.html'
  end

  get "/restaurants/new/?" do
    erb :'restaurants/new.html'
  end

  get "/restaurants/search/:page/?" do
    unless params[:query]
      flash[:message] = "Invalid Search."
      redirect to "/restaurants" 
    end
    @query = params[:query]
    @restaurants = YelpApi.search(@query, params[:page].to_i)
    erb :'restaurants/search.html'
  end

  get "/restaurants/search/?" do
    redirect to "/restaurants"
  end

  post "/restaurants/?" do
    @restaurant = Restaurant.find_or_create_by(params[:restaurant])
    @restaurant.user_ids
    redirect to "/restaurants/#{@restaurant.id}"
  end

  post '/restaurants/:id/adduser/?' do
    @restaurant = Restaurant.find(params[:id])
    UserRestaurant.create(user: User.find(params[:user_id]), restaurant: @restaurant)
    flash[:message] = "Successfully added to Interests."
    redirect to "/restaurants/#{@restaurant.id}"
  end

  get "/restaurants/:id/?" do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show.html'
  end

  get "/restaurants/:id/edit/?" do
    @restaurant = Restaurant.find(params[:id])  
    erb :'/restaurants/edit.html'
  end

  patch "/restaurants/:id/?" do
    Restaurant.find(params[:id]).update(params[:user])
    redirect to "/restaurants/#{params[:id]}"
  end

  delete "/restaurants/:id/?" do
    Restaurant.find(params[:id]).delete
    redirect to "/restaurants"
  end


end
