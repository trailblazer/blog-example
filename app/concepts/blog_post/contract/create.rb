require "reform"
require "reform/form/dry"
module BlogPost::Contract
  class Create < Reform::Form
    include Dry
    property :title
    property :content
    property :current_user, virtual: true
    property :user_id, prepopulator: ->(options) { self.user_id = self.current_user.id }
    property :description

    validation do
      required(:title).filled
      required(:content).maybe(min_size?: 9)
      required(:user_id).filled
      required(:description).filled
    end
  end
end
