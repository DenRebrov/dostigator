class AddStatusToTargets < ActiveRecord::Migration[5.1]
  def change
    add_column :targets, :status, :integer
  end
end
