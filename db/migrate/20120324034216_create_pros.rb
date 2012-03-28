class CreatePros < ActiveRecord::Migration
  def change
    create_table :pros do |t|
			t.string :name, :null => false
			t.string :addr_zone, :null => false
			t.string :address, :null => false
			t.integer :phone, :null => false
			t.string :arr_name, :null => false
			t.string :arr_addr_zone, :null => false
			t.string :arr_address, :null => false
			t.integer :arr_phone, :null => false
			t.text :request_sender
			t.string :select
			t.text :test

      t.timestamps
    end
  end
end
