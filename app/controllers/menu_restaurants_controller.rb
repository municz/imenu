class MenuRestaurantsController < ApplicationController
  # GET /menu_restaurants
  # GET /menu_restaurants.json
  def index
    @menu_restaurants = MenuRestaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_restaurants }
    end
  end

  # GET /menu_restaurants/1
  # GET /menu_restaurants/1.json
  def show
    @menu_restaurant = MenuRestaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_restaurant }
    end
  end

  # GET /menu_restaurants/new
  # GET /menu_restaurants/new.json
  def new
    @menu_restaurant = MenuRestaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu_restaurant }
    end
  end

  # GET /menu_restaurants/1/edit
  def edit
    @menu_restaurant = MenuRestaurant.find(params[:id])
  end

  # POST /menu_restaurants
  # POST /menu_restaurants.json
  def create
    @menu_restaurant = MenuRestaurant.new(params[:menu_restaurant])

    respond_to do |format|
      if @menu_restaurant.save
        format.html { redirect_to @menu_restaurant, notice: 'Menu restaurant was successfully created.' }
        format.json { render json: @menu_restaurant, status: :created, location: @menu_restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_restaurants/1
  # PUT /menu_restaurants/1.json
  def update
    @menu_restaurant = MenuRestaurant.find(params[:id])

    respond_to do |format|
      if @menu_restaurant.update_attributes(params[:menu_restaurant])
        format.html { redirect_to @menu_restaurant, notice: 'Menu restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_restaurants/1
  # DELETE /menu_restaurants/1.json
  def destroy
    @menu_restaurant = MenuRestaurant.find(params[:id])
    @menu_restaurant.destroy

    respond_to do |format|
      format.html { redirect_to menu_restaurants_url }
      format.json { head :no_content }
    end
  end
end
