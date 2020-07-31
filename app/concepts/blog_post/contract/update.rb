require "reform"
require "reform/form/dry"
module BlogPost::Contract
  class Update < Reform::Form
    include Dry
    property :title
    property :content
    property :user_id
    property :description

    validation do
      required(:title).filled
      required(:content).maybe(min_size?: 9)
      required(:user_id).filled
      required(:description).filled
    end
  end
end
