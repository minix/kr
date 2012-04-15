class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :name
      t.string :oname
      t.boolean :friend
      t.boolean :ofriend
      t.text :content
      t.text :ocontent
      t.string :test

      t.timestamps
    end
  end
end
