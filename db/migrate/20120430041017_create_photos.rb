class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :comment
      t.string :name
      t.string :content_type
      t.binary :data, :limit => 1.megabyte

      t.timestamps
    end
  end
end
