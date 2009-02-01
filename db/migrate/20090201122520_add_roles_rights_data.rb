class AddRolesRightsData < ActiveRecord::Migration
  def self.up
    down
    
    #Admin
    role_admin  = Role.create :name => "Admin"
    right_all = Right.create :name => "all", :controller => "*", :action => "*"
    role_admin.rights << right_all
    role_admin.save!
    
  end

  def self.down
    Role.delete(:all)
    Right.delete(:all)
  end
end
