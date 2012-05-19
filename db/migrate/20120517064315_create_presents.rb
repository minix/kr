class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
			t.string :content_type

      t.timestamps
    end
  end
end
