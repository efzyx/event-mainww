class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :nama_event
      t.boolean :is_open
      t.boolean :is_tim
      t.text :deskripsi

      t.timestamps
    end
  end
end
