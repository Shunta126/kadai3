class AddDetailsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :title, :text
    add_column :books, :body, :text
  end
end
