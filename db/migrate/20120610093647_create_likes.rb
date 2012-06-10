class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :like_user
      t.string :like_present_name

      t.timestamps
    end
  end
end
