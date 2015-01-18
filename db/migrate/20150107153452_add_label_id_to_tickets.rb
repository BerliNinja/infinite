class AddLabelIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :label_id, :integer
  end
end
