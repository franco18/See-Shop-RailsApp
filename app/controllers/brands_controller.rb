class BrandsController < ApplicationController
  respond_to :json, :html, :js
  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.search(params[:search])
    @brands.each do |brand|
      brand.image_url = brand.avatar
    end
    respond_with(@brands)
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])
    @brand.image_url = @brand.avatar
    @brand.promos.each do |promo|
      promo.image_url = promo.image
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json {render json: @brand.to_json(
        only: [:name, :email, :image_url,:id, :phone, :web_page, :nit,
          :description],
        include: [:promos, stores: {
          only: [:address, :email, :id, :name],
          include: {shopping_area: {only:[:name, :city, :longitude, :latitude,
            :description, :address]}}
        }]
      )}
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @brand = Brand.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(params[:brand])
    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])
    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end
end
