class AddLectureIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :lecture_id, :integer
    remove_column :pages, :lecture
  end
end
