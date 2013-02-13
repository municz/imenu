class StaticPagesController < ApplicationController
  def home
    #@menus = Menu.all
    @restaurants = Restaurant.all

    @menuRestaurants = MenuRestaurant.where("date = ?", params['date'])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
      format.json { render json: @restaurants }
      format.json { render json: @menuRestaurants }
    end
  end
end
