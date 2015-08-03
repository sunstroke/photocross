class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :position
      t.text :info
      t.integer :pos
      t.string :bg

      t.timestamps
    end
  end
end
