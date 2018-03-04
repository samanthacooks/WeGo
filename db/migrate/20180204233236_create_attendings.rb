class CreateAttendings < ActiveRecord::Migration[5.1]
  def change
    create_table :attendings do |t|
      t.integer :user_id, foreign_key:true, null:false
      t.integer :event_id, foreign_key:true, null:false

      t.timestamps
    end
  end
end
