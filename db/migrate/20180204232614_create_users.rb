class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :email, null:false
      t.string :password_digest, null:false
      t.string :access_token
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
