# -*- encoding : utf-8 -*-
class ModifyUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :crypted_password, :string, :null => true
    change_column :users, :password_salt, :string, :null => true
    change_column :users, :persistence_token, :string, :null => true
    change_column :users, :single_access_token, :string, :null => true
    change_column :users, :perishable_token, :string, :null => true
  end

  def self.down
  end
end
