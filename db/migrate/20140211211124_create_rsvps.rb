class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :code
      t.string :comments
      t.boolean :responded, default: false

      t.timestamps
    end
  end
end
