class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :hash_passwd
      t.string :passwd
      t.string :salt
      t.string :email

      t.timestamps
    end
  end
end
