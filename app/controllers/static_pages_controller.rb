class StaticPagesController < ApplicationController
  def home
    
    unless ( params['restaurant'].present? and params['date'].present?)
      params['restaurant'] = "1"
      params['date'] = Date.today.to_s
    end

    #@menus = Menu.all
    @restaurants = Restaurant.all

    @menuRestaurants = MenuRestaurant.where("date = ? AND restaurant_id = ?", params['date'], params['restaurant'])

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @menus }
      format.json { render json: @restaurants }
      format.json { render json: @menuRestaurants }
    end
  end
end
