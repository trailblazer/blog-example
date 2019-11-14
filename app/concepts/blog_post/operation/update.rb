class BlogPost::Operation::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(BlogPost, :find_by)
    step Contract::Build( constant: BlogPost::Contract::Update )
  end

  step Subprocess(Present)
  step Contract::Validate( key: :blog_post )
  step Contract::Persist()

  def status_save(ctx, model:, **)
    # could not pass id to subprocess of StatusSave. Didint spend too much time on figuring out about the new Subprocess macro though so it remains a TODO for later
    ctx[:saved] = model.update(status: :saved)
  end
  # step Subprocess(BlogPost::Operation::StatusSave)
end
