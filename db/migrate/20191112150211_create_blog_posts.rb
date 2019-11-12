class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
