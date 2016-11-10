class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit,:destroy,:new]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
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
    if @post.save
      flash[:notice] = 'El post fue guardado exitosamente'
      redirect_to post_path(id: @post.id, it_was: 'created')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update (post_params)
      flash[:notice] = "El post fue editado exitosamente."
      redirect_to post_path(id: @post.id, it_was: 'updated')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:notice] = "El producto fue eliminado satisfactoriamente"
    redirect_to posts_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:tittle, :content_post)
    end
end
