class CreateKvstorages < ActiveRecord::Migration
  def change
    create_table :kvstorages do |t|
      t.string :key
      t.string :value
      t.integer :hits, default: 0
      t.timestamps
    end
  end
end
