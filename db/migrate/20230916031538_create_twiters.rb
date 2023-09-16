class CreateTwiters < ActiveRecord::Migration[7.0]
  def change
    create_table :twiters do |t|
      t.text :description
      t.string :user_name

      t.timestamps
    end
  end
end
