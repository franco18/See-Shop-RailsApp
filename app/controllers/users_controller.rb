class UsersController < ApplicationController
  respond_to :json, :html, :js

  def new
  end

  def create_from_facebook
    Rails.logger.info "*******************Creando usaurio de fb*************************"
    token = params[:token]
    facebook_id = params[:user_id]
    user = User.where(facebook_id: params[:user_id]).first
    fb_user = FbGraph::User.fetch(facebook_id, :access_token => token)
    if user.nil?
      Rails.logger.info "No encontre usuarios, entonces lo creo"
      user = User.create(username: fb_user.name, facebook_id: facebook_id,
        email: fb_user.email, birthday: fb_user.birthday, gender: fb_user.gender)
      Rails.logger.info "**** USER ****"
      Rails.logger.info "#{user.inspect}"
    else
      Rails.logger.info "Estoy actualizando, porque lo encontre"
      user.update_attributes(username: fb_user.name, facebook_id: facebook_id,
        email: fb_user.email, birthday: fb_user.birthday, gender: fb_user.gender)
      Rails.logger.info "Termine de actualizar"
      Rails.logger.info "**** USER ****"
      Rails.logger.info "#{user.inspect}"
    end
    # Get all likes on registration
    likes = likes_from_facebook(facebook_id, token)
    promos = Promo.all
    #Algorithm for promos by facebook likes
    promos_by_facebook_likes(likes, promos)
    render nothing: true
  end

  def promos_by_facebook_likes(likes, promos)
    Rails.logger.info "***********Haciendo el metodo****************"
    t1 = Time.now
    promos_recommended = []
    likes.each do |like|
      like_name = like.name.downcase
      promos.each do |promo|
        promo_name = promo.name.downcase
        if promo_name.include? like_name
          promos_recommended << promo unless promos_recommended.include? promo
        end
      end
    end
    Rails.logger.info "Promociones recomendadas:"
    Rails.logger.info "#{promos_recommended.inspect}"
    t2 = Time.now
    delta = (t2 - t1)/60
    Rails.logger.info "********Algorithm DELTA********"
    Rails.logger.info "Delta = #{delta}"
  end

  def likes_from_facebook(facebook_id, token)
    user = FbGraph::User.fetch(facebook_id, :access_token => token)
    likes = user.likes(limit: 100)
    i = 0
    j = 1
    all_likes = []
    t1 = Time.now
    begin
      Rails.logger.info "**** Pagina #{i} *****"
      likes.each do |like|
        Rails.logger.info "#{j} #{like.category}: #{like.name}"
        all_likes << like
        j += 1
      end
      i += 1
      likes = likes.next
    end while (!likes.blank?)
    t2 = Time.now
    delta = (t2 - t1)/60
    Rails.logger.info "********FACEBOOK DELTA********"
    Rails.logger.info "Delta = #{delta}"
    return all_likes
  end

  def edit
  end

  def show
  end

  def index
  end

  def register_client
    @user = User.where(facebook_id: params[:facebook_id])
    respond_to do |format|
      if @user.nil?
        format.json { render json: "The user does not exist"}
      else
        @user.update_attributes(notifications_code: params[:notifications_code])
        format.json { render json: "true"}
      end
    end
  end

  def self.send_push_notification(message)
    @users = User.all
    Rails.logger.info "******* Estoy en send send_push_notification *********"
    @users.each do |user|
      Rails.logger.info "user: #{user.username}"
      Rails.logger.info "notifications_code: #{user.notifications_code}"
      device = Gcm::Device.where(registration_id: user.notifications_code).first_or_create
      notification = Gcm::Notification.new
      notification.device = device
      notification.collapse_key = "updates_available"
      notification.delay_while_idle = true
      notification.data = {:registration_ids => [user.notifications_code], :data => {:msg => "Get on cloud nine"}}
      Rails.logger.info "Notification"
      Rails.logger.info "#{notification.inspect}"
      notification.save
      Gcm::Notification.send_notifications
      Rails.logger.info "He enviado la notificacion"
    end
    # registration_ids= ["12", "13"] # an array of one or more client registration IDs
  end
end
