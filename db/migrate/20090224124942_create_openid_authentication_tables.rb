# -*- encoding : utf-8 -*-
class CreateOpenidAuthenticationTables < ActiveRecord::Migration
  def self.up
    create_table :open_id_authentication_associations do |t|
      t.integer :issued, :lifetime
      t.string :handle, :assoc_type
      t.binary :server_url, :secret
    end

    create_table :open_id_authentication_nonces do |t|
      t.integer :timestamp, :null => false
      t.string :server_url, :null => true
      t.string :salt, :null => false
    end
  end

  def self.down
    drop_table :open_id_authentication_associations
    drop_table :open_id_authentication_nonces
  end
end