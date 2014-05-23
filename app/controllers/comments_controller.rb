class CommentsController < ApplicationController
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(@comment.post_id) unless @post
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user.email
    @comment.author_email = current_user.email
    @comment.user_ip = request.remote_ip
    @comment.user_agent = request.user_agent
    @comment.referrer = request.referer
    @comment.post_id = params[:post_id]
    @comment.approved = policy(@comment).publish? ? true : false
    respond_to do |format|
      if @comment.save
        notice = @comment.approved ? 'Comment was successfully created.' : 'Comment was successfully created. It will be published once an editor approves it.'
        format.html { redirect_to post_path(@comment.post_id), notice: notice }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      notice = params['comment']['approved'] && !@comment.approved ? 'Comment approved.' : 'Comment was successfully updated.'
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post_id), notice: notice }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@comment.post_id), notice: 'Comment deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(*policy(@comment || Comment).permitted_attributes)
    end
end
