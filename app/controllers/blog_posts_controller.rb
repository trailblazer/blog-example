# frozen_string_literal: true

class BlogPostsController < ApplicationController

  def index
    render :index, locals: { blog_posts: blog_posts }
  end

  def show
    render :show, locals: { blog_post: blog_post }
  end

  def new
    run BlogPost::Operation::Create::Present
    render :new, locals: { form: @form}
  end

  def create
    result = BlogPost::Operation::Create.(params: params, current_user: current_user)
    if result
      flash[:notice] = "#{result[:model].title} has been created"
      return redirect_to blog_post_path(result[:model].id)
    else
      flash[:alert] = "#{result["contract.default"].errors.messages}"
      redirect_back(fallback_location: new_blog_post_path)
    end
  end

  def edit
    run BlogPost::Operation::Update::Present
    render :edit, locals: { form: @form}
  end

  def update
    result = BlogPost::Operation::Update.(params: params, current_user: current_user)
    if result
      flash[:notice] = "#{result[:model].title} has been saved"
      return redirect_to blog_post_path(result[:model].id)
    else
      flash[:alert] = "#{result["contract.default"].errors.messages}"
      redirect_back(fallback_location: edit_blog_post_path(params[:id]))
    end
  end


  def destroy; end

  private

  def _run_options(options)
    options.merge( "current_user" => current_user )
  end

  def blog_posts
    @blog_posts ||= BlogPost.where(user_id: current_user.id)
  end

  def blog_post
    @blog_post ||= BlogPost.find(params[:id])
  end
end
