class AddVisibleToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :visible, :boolean
  end
end
