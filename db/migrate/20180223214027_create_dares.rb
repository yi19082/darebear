class CreateDares < ActiveRecord::Migration[5.0]
  def change
    create_table :dares do |t|
      t.integer :dare_giver
      t.integer :dare_recepient
      t.integer :upvote_count
      t.boolean :completed
      t.string :description

      t.timestamps
    end
  end
end
