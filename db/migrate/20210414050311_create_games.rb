class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :permalink
      t.integer :engine_code

      t.references :user, foreign_key: true
      t.references :default_language, foreign_key: {to_table: :languages}

      t.timestamps
    end
  end
end
