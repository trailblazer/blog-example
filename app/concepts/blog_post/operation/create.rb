# frozen_string_literal: true

class BlogPost::Operation::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(BlogPost, :new)
    step Contract::Build(builder: :contract_builder)
    step :prepopulate

    def contract_builder(ctx, model:, **)
      BlogPost::Contract::Create.new(model, current_user: ctx[:current_user])
    end

    def prepopulate(ctx, **)
      ctx['contract.default'].prepopulate!
    end
  end

  step Subprocess(Present)
  step Contract::Validate(key: :blog_post)
  step Contract::Persist()
  step :status_save

  def status_save(ctx, model:, **)
    # could not pass id to subprocess of StatusSave. I think cause of object persistence not being complete yet somehow? TODO in general
    ctx[:saved] = model.update(status: :saved)
  end
end
