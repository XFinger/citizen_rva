class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :pic
      t.string :title
      t.datetime :published_on
      t.string :post

      t.timestamps
    end
  end
end
