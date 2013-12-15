class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.string :file
      t.string :lecture
      t.string :category
      t.integer :user_id
      t.timestamps
    end
  end
end
