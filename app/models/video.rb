class Video < ActiveRecord::Base
  attr_accessible :course, :qa_complete, :qa_id, :subject, :title, 
  :translate_complete, :translator_id, :type_complete, :typer_id, :video_id, :due_date, :translation_handwritten

  validates :video_id, :presence => true, :uniqueness => true

  mount_uploader :translation_handwritten, TranslationsUploader

  before_create :set_due_date_to_month_from_now

  #prevent null due dates
  def set_due_date_to_month_from_now
  	self.due_date = 1.month.from_now
  end

  def set_initial_values
  	set_due_date_to_month_from_now
  	self.translate_complete = false
  	self.type_complete = false
  	self.qa_complete = false
  end
  
end
