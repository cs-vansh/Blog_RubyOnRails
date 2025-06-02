class BlogPostsController < ApplicationController
  # authenticate_user! is from Devise. basically checks if logged in.
  # if not logged in, then we redirect to login page with a message, you must be signed in to perform this action.
  before_action :authenticate_user!, except: [ :index, :show ]

  # except for the following methods, all methods/actions would use it.
  before_action :set_blog_post, except: [ :index, :new, :create ]
  # or - define what methods should use it
  # before_action :set_blog_post, only: [ :show, :edit, :update, :destroy ]

  def index
    # @blog_posts = BlogPost.all
    # either all BlogPost in sorted order or Published BlogPost in sorted order
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted

    # paginate the posts
    @pagy, @blog_posts = pagy(@blog_posts)
  end

  def show
    # @blog_post = BlogPost.find(params[:id])
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    # to avoid any other field/value injection.
    params.require(:blog_post).permit(:title, :content, :published_at)
  end

  def set_blog_post
    # if user_signed_in?
    #   @blog_post = BlogPost.find(params[:id])
    # else
    #   @blog_post = BlogPost.published.find(params[:id])
    # end
    # or in a simplified way::
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
