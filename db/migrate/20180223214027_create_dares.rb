class CreateDares < ActiveRecord::Migration[5.0]
  def change
    create_table :dares do |t|
      t.references :dare_giver
      t.references :dare_recepient
      t.integer :upvote_count
      t.boolean :completed
      t.boolean :accepted
      t.text :description

      t.timestamps
    end
  end
end
