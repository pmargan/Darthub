class CreateJoinTableOdersItem < ActiveRecord::Migration[5.2]
  def change
    create_join_table :orders, :items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
