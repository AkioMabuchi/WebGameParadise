class CreateUnity201904Games < ActiveRecord::Migration[6.0]
  def change
    create_table :unity201904_games do |t|
      t.integer :width, default: 960
      t.integer :height, default: 540
      t.boolean :is_allowed_fullscreen, default: false, null: false
      t.string :loader_file
      t.string :data_file
      t.string :code_file
      t.string :framework_file

      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
