class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name, null:false
      t.date :date, null:false
      t.string :type, null:false
      t.string :location, null:false
      t.integer :creator_id, foreign_key:true, null:false



      t.timestamps
    end
  end
end
