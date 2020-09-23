class CreateUserPrpfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_prpfiles do |t|
      t.string  :image,         null: false 
      t.string  :name,          null: false 
      t.integer :prefecture_id, null: false 
      t.string  :hobby,         null: false 
      t.string  :text
      t.references :user,       null: false, foreign_key: true
    end
  end
end
