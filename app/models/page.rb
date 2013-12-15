class Page < ActiveRecord::Base
  attr_accessible :title, :description, :file, :lecture, :category, :user_id

  mount_uploader :file, FileUploader

  CATEGORIES = ['Aufgabe', 'Loesung', 'Info', 'ZIP']
    
end
