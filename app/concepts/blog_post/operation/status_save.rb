# frozen_string_literal: true

class BlogPost::Operation::StatusSave < Trailblazer::Operation
  step :modify_params
  step Subprocess(BlogPost::Operation::Update::Present)
  fail :model_not_found, fail_fast: true
  step :save_post
  fail :save_error, fail_fast: true

  def modify_params(_ctx, params:, **)
    params[:id] = params[:blog_post_id]
  end

  def save_post(ctx, model:, **)
    ctx[:saved] = model.update(status: :saved)
  end

  # !!--ERRORS--!!

  def model_not_found(ctx, **)
    ctx[:errors] = 'BlogPost was not found'
  end

  def save_error(ctx, **)
    ctx[:errors] = 'Blog Post could not have been saved'
  end
end
