class PromosController < ApplicationController
  respond_to :json, :html, :js

  def facebook_token
    token = params[:token]
    user_id = params[:user_id]
    user = FbGraph::User.fetch(user_id, :access_token => token)
    likes = user.likes
    Rails.logger.info "********LIKES*************"
    # if likes.include? :next
    #   puts "YES!!!!!!!!!"
    # end
    likes.each do |like|
      Rails.logger.info "#{like.inspect}"
      Rails.logger.info "#{like.category}"
      Rails.logger.info "#{like.name}"
    end
    @user = user.name
    UsersController.send_push_notification("aa")
    respond_to do |format|
      format.json { render json: @user}
    end
  end

  # GET /promos
  # GET /promos.json
  def index
    @promos = Promo.search(params[:search])
    @promos.each do |promo|
      promo[:brand_name] = promo.brand.name
      promo.image_url = promo.image
    end
    respond_with(@promos)
  end

  # GET /promos/1
  # GET /promos/1.json
  def show
    @promo = Promo.find(params[:id])
    @promo.image_url = @promo.image
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @promo }
    end
  end

  # GET /promos/new
  # GET /promos/new.json
  def new
    @promo = Promo.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @promo }
    end
  end

  # GET /promos/1/edit
  def edit
    @promo = Promo.find(params[:id])
  end

  # POST /promos
  # POST /promos.json
  def create
    @promo = Promo.new(params[:promo])
    brand = @promo.brand
    @promo.stores = brand.stores
    respond_to do |format|
      if @promo.save
        format.html { redirect_to @promo, notice: 'Promo was successfully created.' }
        format.json { render json: @promo, status: :created, location: @promo }
      else
        format.html { render action: "new" }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /promos/1
  # PUT /promos/1.json
  def update
    @promo = Promo.find(params[:id])
    brand = Brand.find(params[:promo][:brand_id])
    @promo.stores = brand.stores
    respond_to do |format|
      if @promo.update_attributes(params[:promo])
        format.html { redirect_to @promo, notice: 'Promo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promos/1
  # DELETE /promos/1.json
  def destroy
    @promo = Promo.find(params[:id])
    @promo.destroy

    respond_to do |format|
      format.html { redirect_to promos_url }
      format.json { head :no_content }
    end
  end

  def user_location
    #Esto hay que borrarlo!!!!!!!!!!!!!!
    Location.create!(:location => params[:latitude])
  end
end
