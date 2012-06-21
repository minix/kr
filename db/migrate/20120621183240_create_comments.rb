class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.integer :present_id
      t.string :comment_content

      t.timestamps
    end
  end
end
