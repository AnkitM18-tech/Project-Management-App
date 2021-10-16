class AddCompletionAtToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :completed_at, :datetime
  end
end
