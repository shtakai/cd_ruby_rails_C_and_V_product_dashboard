class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.errors.blank?
      flash[:notice] = "Comment created #{@comment.id} #{@comment.comment}"
      redirect_to "/products/#{@comment.product_id}"
    else
      flash[:alert] = "Comment create failed #{@comment.comment}"
      @product = Product.find_by_id(@comment.product_id)
      render 'products/show'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comment, :product_id)
  end
end
