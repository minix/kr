class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :user_name
      t.string :talk_content

      t.timestamps
    end
  end
end
