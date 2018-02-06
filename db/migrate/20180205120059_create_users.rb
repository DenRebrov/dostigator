class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :ava
      t.datetime :birthday

      t.timestamps
    end
  end
end
