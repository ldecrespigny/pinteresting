class Pin < ActiveRecord::Base
	Paperclip.options[:command_path] = 'C:/Program Files/ImageMagick-6.8.5-Q16'
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :blurimage #, :styles => { :medium => "300x300>", :thumb => "100x100>" }



def self.search(search)
  if search
    find(:all, :conditions => ['"description" LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
