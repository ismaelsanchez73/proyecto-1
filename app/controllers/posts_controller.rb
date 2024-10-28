class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # Solo usuarios autenticados pueden crear, editar o eliminar

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id]) # Cargar la publicación para editar
  end

  def update
    @post = Post.find(params[:id]) # Cargar la publicación para actualizar
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id]) # Cargar la publicación a eliminar
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end  
end