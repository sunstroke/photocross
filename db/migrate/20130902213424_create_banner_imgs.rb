class CreateBannerImgs < ActiveRecord::Migration
  def change
    create_table :banner_imgs do |t|
      t.string :img
      t.integer :left
      t.integer :top
      t.integer :sp
      t.integer :z
      t.integer :banner_id
      t.integer :pos

      t.timestamps
    end
  end
end
