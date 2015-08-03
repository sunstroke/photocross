# -*- encoding : utf-8 -*-
class AddEventIsRegistrationOpened < ActiveRecord::Migration
  def self.up
    add_column :events, :is_registration_opened, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :events, :is_registration_opened
  end
end
