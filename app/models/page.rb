class Page < ActiveRecord::Base
  attr_accessible :title, :description, :file, :lecture, :category, :user, :content_type

  validates :title, :file, :lecture, :presence => true 

  mount_uploader :file, FileUploader

  CATEGORIES = ['Aufgabe', 'Loesung', 'Info', 'ZIP']

  before_save :update_file_type
  
  private
  
  def update_file_type
    if file.present?
      self.content_type = file.file.content_type
    end
  end


    
end
