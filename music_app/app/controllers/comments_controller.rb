class CommentsController < ApplicationController
  load_and_authorize_resource

  # GET /comments
  # GET /comments.json

  before_filter :load_song

  def index
    @comments = @song.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @song.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = @song.comments.new
   

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # # GET /comments/1/edit
  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @song.comments.new(params[:comment])
    @comment.user = current_user
    @comment.flagged = false

    if @comment.save
      redirect_to song_path(@song)
    else
      redirect_to song_path(@song), notice: "comment not saved"
    end
    
  end

  # # PUT /comments/1
  # # PUT /comments/1.json
  # def update
  #   @comment = Comment.find(params[:id])

  #   respond_to do |format|
  #     if @comment.update_attributes(params[:comment])
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @song.comments.find(params[:id])
    @comment.destroy

    if current_user.role == "admin"
      redirect_to admin_path
    else

    redirect_to song_path(@song)
  end
  
    
  end

  
 

  def flag
    @comment = @song.comments.find(params[:id])
    if current_user && current_user.role == "admin"
      if @comment.flagged == true
        @comment.flagged = false
      else
        @comment.flagged = true
      end
    else
      @comment.flagged = true
    end
    @comment.save
      redirect_to song_path(@song)
    
  end



  private
  def load_song
    @song = Song.find(params[:song_id])
   end

 end
