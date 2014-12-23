class AddLabelIdToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :label_id, :integer
  end
end
