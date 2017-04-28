class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.references :team, foreign_key: true
      t.integer :nilai
      t.text :keterangan
      t.string :oleh

      t.timestamps
    end
  end
end
