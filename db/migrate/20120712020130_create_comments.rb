class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :present_id
      t.text :comment_content
      t.string :username

      t.timestamps
    end
  end
end
