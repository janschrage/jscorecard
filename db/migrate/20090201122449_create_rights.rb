class CreateRights < ActiveRecord::Migration
  def self.up
    create_table :rights do |t|
      t.string :name
      t.string :controller
      t.string :action

      t.timestamps
    end

    create_table :rights_roles, :id => false do |t|
      t.column "right_id" , :integer
      t.column "role_id" , :integer
      
      t.timestamps
    end

  end

  def self.down
    drop_table :rights
    drop_table :rights_roles
  end
end
