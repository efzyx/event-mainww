class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :title
      t.references :event, foreign_key: true
      t.text :deskripsi

      t.timestamps
    end
  end
end
