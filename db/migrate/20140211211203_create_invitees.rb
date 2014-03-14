class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.references :rsvp
      t.string :name
      t.boolean :coming

      t.timestamps
    end
    add_index :invitees, :rsvp_id
  end
end
