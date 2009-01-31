class CreateKpis < ActiveRecord::Migration
  def self.up
    create_table :kpis do |t|
      t.string :name
      t.text :description
      t.integer :target_id
      t.boolean :bigger_is_better

      t.timestamps
    end
  end

  def self.down
    drop_table :kpis
  end
end
