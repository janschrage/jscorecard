class CreatePerspectives < ActiveRecord::Migration
  def self.up
    create_table :perspectives do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :perspectives
  end
end
