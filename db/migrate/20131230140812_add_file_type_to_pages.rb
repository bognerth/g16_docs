class AddFileTypeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :content_type, :string, :default => 'text/plain'
  end
end
