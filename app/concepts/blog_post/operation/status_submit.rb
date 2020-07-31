# frozen_string_literal: true

class BlogPost::Operation::StatusSubmit < Trailblazer::Operation
  step :modify_params
  step Subprocess(BlogPost::Operation::Update::Present)
  fail :model_not_found
  step :submit_post
  fail :submit_error

  def modify_params(_ctx, params:, **)
    params[:id] = params[:blog_post_id]
  end

  def submit_post(ctx, model:, **)
    ctx[:submited] = model.update(status: :submitted)
  end

  # !!--ERRORS--!!

  def model_not_found(ctx, **)
    ctx[:errors] = 'BlogPost was not found'
  end

  def submit_error(ctx, **)
    ctx[:errors] = 'Blog Post could not have been submited'
  end
end
