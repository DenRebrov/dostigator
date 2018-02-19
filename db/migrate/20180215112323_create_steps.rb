class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :status
      t.integer :target_id

      t.timestamps
    end
  end
end
