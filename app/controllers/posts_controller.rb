class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_user, only: %i[ show edit update destroy index create new]
  before_action :set_post, only: %i[ show edit update destroy ]
  #before_action :validate_autorization, only: [:edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = @user.posts
    @kind = "Posts of #{@user.name}"
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit2
  def edit
    @post = @user.posts.find(params[:id])
    authorize @post
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(current_user, @post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = @user.posts.find(params[:id])
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_post_path(@user, @post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = @user.posts.find(params[:id])
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_path, notice: "Post was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @user.posts.find(params[:id])
    end

  def set_user
    @user = User.find(params[:user_id])
  end

    # def validate_autorization
    #   if current_user == @post.user
    #     #message and work for changed of post
    #     true
    #   else
    #     redirect_back(fallback_location: root_path, notice: "Post cannot be changed by non-author ")
    #   end
    # end
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :image, :user_id)
    end
end
