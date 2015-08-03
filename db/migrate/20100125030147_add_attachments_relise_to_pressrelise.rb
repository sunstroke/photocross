# -*- encoding : utf-8 -*-
class AddAttachmentsReliseToPressrelise < ActiveRecord::Migration
  def self.up
    add_column :pressrelises, :relise_file_name, :string
    add_column :pressrelises, :relise_content_type, :string
    add_column :pressrelises, :relise_file_size, :integer
    add_column :pressrelises, :relise_updated_at, :datetime
  end

  def self.down
    remove_column :pressrelises, :relise_file_name
    remove_column :pressrelises, :relise_content_type
    remove_column :pressrelises, :relise_file_size
    remove_column :pressrelises, :relise_updated_at
  end
end
