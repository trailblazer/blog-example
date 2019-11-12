class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.text :content
      t.references :user, index: true
      t.references :blog_post, index: true
      t.timestamps
    end
  end
end
