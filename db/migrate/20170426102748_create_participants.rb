class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :display_name
      t.string :tele_username
      t.references :event, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
