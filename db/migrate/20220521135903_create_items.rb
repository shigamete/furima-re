class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,     null: false
      # t.text    :explan,   null: false
      # t.integer :category, null: false
      # t.integer :status,   null: false
      # t.integer :shippingfee_payer, null: false
      # t.integer :prefecture,    null: false
      # t.integer :shipping_days, null: false
      # t.integer :price,    null: false
      # t.references :user,  null: false, foreign_key: true
      # t.timestamps
    end
  end
end