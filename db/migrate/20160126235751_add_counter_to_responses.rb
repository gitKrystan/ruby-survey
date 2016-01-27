class AddCounterToResponses < ActiveRecord::Migration
  def change
    change_table(:responses) do |t|
      t.integer :counter, :default => 0
    end
  end
end
