class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end
end
