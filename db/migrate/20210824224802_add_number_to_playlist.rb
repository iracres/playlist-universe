class AddNumberToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :number, :integer
  end
end
