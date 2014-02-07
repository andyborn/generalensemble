class UsersController < ApplicationController
   load_and_authorize_resource
  # GET /users
  # GET /users.json

  def tagged
  if params[:tag].present? 
    @users = User.tagged_with(params[:tag])
    @tag = params[:tag]
  else 
    @users = User.all
  end  
  end


  def index
    @users = User.artists.order('artist_name')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    

    if @user.save
      session[:user_id] = @user.id unless current_user
      redirect_to users_path, notice: "Signed up!"
    else
      render "new"
    end

  end


  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if current_user.role == "admin"
      redirect_to admin_path
    else
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    end
  end
end
