class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :FullName
      t.string :email
      t.string :PhoneNumber
      t.string :password

      t.timestamps
    end
  end
end
