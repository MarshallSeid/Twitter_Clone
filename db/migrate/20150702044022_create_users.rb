class CreateUsers < ActiveRecord::Migration
  def change #the model acts as a single user, database table holds multiple users
    create_table :users do |t| #t stands for table
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
