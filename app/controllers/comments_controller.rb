class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'El comentario fue guardado exitosamente'
    else
      flash[:alert] = 'El comentario fue guardado erroneamente'
    end
    redirect_to post_path(id: params[:comment][:post_id])
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update (comment_params)
      flash[:notice] = "El comentario fue editado exitosamente."
      redirect_to comment_path(id: @comment.id, it_was: 'updated')
    else
      render :edit
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    flash[:notice] = "El producto fue eliminado satisfactoriamente"
    redirect_to comments_path

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment_content, :post_id, :user_id)
    end
end
