require 'httparty'

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    isbn = post_params[:isbn] # ISBNを取得
    @post = Post.create_from_isbn(isbn) # ISBNから情報を取得して新しい投稿を作成

    if @post&.persisted?
      render json: @post, status: :created
    else
      render json: { error: 'Failed to create post' }, status: :unprocessable_entity
    end
  end
  

  def show
    render json: @post
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:isbn, :date, :thoughts, :evaluation_id)
  end
end
