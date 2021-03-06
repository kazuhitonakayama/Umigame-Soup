class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:today,:ranking,:show,:edit,:create,:update,:destroy,:indexusername]

  # GET /posts
  # GET /posts.json
  def index
    if params[:search] == nil
      @posts = Post.all.page(params[:page]).per(6)
    elsif params[:search] == '' 
      @posts = Post.all.page(params[:page]).per(6)
    else
      @posts = Post.where("body LIKE ? OR username LIKE ?", '%' + params[:search] + '%','%' + params[:search] + '%').page(params[:page]).per(6)
    end
    #@current_user=current_user.id
    #@ai = Post.find(params[:id])
    # @like = Like.new
    #m @post = Post.find(params[:id])
    # @post = Post.find(params[:id])
  end


  def today
    @posts = Post.order("RANDOM()").limit(1)
  end

  def ranking
    @all_ranks = Post.create_all_ranks
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
      @post = Post.find(params[:id])
      @like = Like.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    @post.username=current_user.name
      if @post.save
        #flash[:notice] = "#{@post.username}さん！<br>新規の問題を投稿しましたよ！"
        flash[:notice] = "問題を投稿しました"
        redirect_to :root
      else
        render action: :new
      end
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body)
    end
end
