class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.string :comment_subtitle
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
