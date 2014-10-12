class ShoppingAreasController < ApplicationController
  respond_to :json, :html, :js

  def promos_by_location
    user_location = [params[:latitude],params[:longitude]]
    Rails.logger.info "user_location = #{user_location.inspect}"
    @promos = ShoppingArea.shopping_areas_in_range(user_location)
    respond_to do |format|
      format.json { render json: @promos}
    end

  end

  # GET /shopping_areas
  # GET /shopping_areas.json
  def index
    @shopping_areas = ShoppingArea.search(params[:search])
    respond_with(@shopping_areas)
  end

  # GET /shopping_areas/1
  # GET /shopping_areas/1.json
  def show
    @shopping_area = ShoppingArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopping_area }
    end
  end

  # GET /shopping_areas/new
  # GET /shopping_areas/new.json
  def new
    @shopping_area = ShoppingArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopping_area }
    end
  end

  # GET /shopping_areas/1/edit
  def edit
    @shopping_area = ShoppingArea.find(params[:id])
  end

  # POST /shopping_areas
  # POST /shopping_areas.json
  def create
    @shopping_area = ShoppingArea.new(params[:shopping_area])
    respond_to do |format|
      if @shopping_area.save
        format.html { redirect_to @shopping_area, notice: 'Shopping area was successfully created.' }
        format.json { render json: @shopping_area, status: :created, location: @shopping_area }
      else
        format.html { render action: "new" }
        format.json { render json: @shopping_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_areas/1
  # PUT /shopping_areas/1.json
  def update
    @shopping_area = ShoppingArea.find(params[:id])

    respond_to do |format|
      if @shopping_area.update_attributes(params[:shopping_area])
        format.html { redirect_to @shopping_area, notice: 'Shopping area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopping_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_areas/1
  # DELETE /shopping_areas/1.json
  def destroy
    @shopping_area = ShoppingArea.find(params[:id])
    @shopping_area.destroy

    respond_to do |format|
      format.html { redirect_to shopping_areas_url }
      format.json { head :no_content }
    end
  end
end
