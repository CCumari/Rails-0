class AddGenre < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :genre, :string
  end
end
