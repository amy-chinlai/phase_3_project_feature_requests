class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
