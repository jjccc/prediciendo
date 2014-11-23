class Author < ActiveRecord::Base
  attr_accessor :file
  attr_accessible :name, :title, :image, :file
  
  has_many :predictions
  
  before_save :process_image
  
  def performance
    (self.successes + self.mistakes) == 0 ? 0.0 : (self.successes.to_f / (self.mistakes + self.successes).to_f * 100)
  end
  
  def has_image?    
    !self.image.nil? && File.exists?(path)
  end
  
  def image_path
    Rails.env.production? ? "/system/uploads/#{self.image}" : "/images/#{self.image}"
  end
  
  def process_image        
    unless self.file.blank?
      self.image = "#{self.name.parameterize}.#{self.file.original_filename.split(".")[1]}"      
      File.open(path, "wb") do |f|
        f.write(self.file.read)
      end
    end    
  end
  
  def refresh
    current_predictions = self.predictions.all
    self.attempts = current_predictions.count    
    self.successes = current_predictions.select{ |p| p.is_pending == false && p.is_success == true }.count
    self.mistakes = current_predictions.select{ |p| p.is_pending == false && p.is_success == false }.count
    self.save
  end
  
  def self.filter(search)
    if search.blank?
      Author.all
    else
      Author.where("(name ilike ?) or (title ilike ?)", "%#{search}%", "%#{search}%")
    end
  end
  
  private 
  
  def path
    Rails.env.production? ? Rails.root.join("public", "system", "uploads", self.image) : Rails.root.join("public", "images", self.image)
  end
  
end
