class PostsController < ApplicationController
  #Checking if a user is signed in to authorize the actions, only web admins can do it since they have accounts
  before_filter :double_auth, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  

  def index
    @posts = Post.all
  end

  def show
  end

  
  def new
    @post = Post.new
  end

 
  def edit
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to @post
        flash[:notice] = "Post was created succesfully!"
      else
        render 'new'
    end
  end

  def update
      if @post.update(post_params)
       redirect_to @post
       flash[:notice] = "Post was updated!"
      else
        render 'edit'
    end
  end

 
  def destroy
    @post.destroy
    redirect_to posts_url
    flash[:notice] = "Post was deleted!"
  end

  private
   

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body,)
    end

     # Use callbacks to share common setup or constraints between actions.
    def double_auth
        if !signed_in?
          flash[:notice] = "Only Tmlss programmers can be here!"
          redirect_to posts_url

        end
    end

end