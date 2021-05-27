class AddUnity201904JsonFile < ActiveRecord::Migration[6.0]
  def change
    add_column :unity201904_games, :json_file, :string
  end
end
