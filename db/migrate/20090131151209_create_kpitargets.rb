class CreateKpitargets < ActiveRecord::Migration
  def self.up
    create_table :kpitargets do |t|
      t.integer :kpi_id
      t.date :begda
      t.date :endda
      t.decimal :target_value, :precision => 8, :scale => 2, :default => 0
      t.boolean :include_in_evaluation

      t.timestamps
    end
  end

  def self.down
    drop_table :kpitargets
  end
end
