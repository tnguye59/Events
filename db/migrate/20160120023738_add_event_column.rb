class AddEventColumn < ActiveRecord::Migration
  def change
  	remove_column :events, :host_id, :integer
  	add_reference :events, :user, index:true
  end
end
