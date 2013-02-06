class StaticPagesController < ApplicationController
  def home
    @menus = Menu.all
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
      format.json { render json: @restaurants }
    end
  end
end
