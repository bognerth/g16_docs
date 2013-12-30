class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.string :file
      t.string :lecture
      t.string :category
      t.string :user
      t.timestamps
    end
  end
end
