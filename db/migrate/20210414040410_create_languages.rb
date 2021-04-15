class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :permalink
      t.string :name

      t.timestamps
    end
  end
end
