class EventUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
     include CarrierWave::MiniMagick
  
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end
  def paperclip_path
      ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension"
    end  
  version :thumb do
    process :resize_to_fit => [100, 100]
   # process resize_to_fit: [100, 100]

  end
  version :medium do
    process :resize_to_limit => [200, 300] 

  end
  version :large do
    process :resize_to_fill => [600, 400]
  end
  
end

class EventPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
   include CarrierWave::MiniMagick
  def paperclip_path
    ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension"
  end  

  version :thumb do
    process :resize_to_fit => [100, 100]
   # process resize_to_fit: [100, 100]

  end
  version :medium do
    process :resize_to_limit => [200, 300] 

  end
  version :large do
    process :resize_to_fill => [600, 400]
  end
  # 
  # 
end


class StartImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
   include CarrierWave::MiniMagick
  def paperclip_path
    ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension"
  end  
  version :thumb do
    process :resize_to_fit => [100, 100]
   # process resize_to_fit: [100, 100]

  end
  version :medium do
    process :resize_to_limit => [200, 300] 

  end
  version :large do
    process :resize_to_fill => [600, 400]
  end
  
end


class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
   include CarrierWave::MiniMagick
  def paperclip_path
    ":rails_root/public/assets/:attachment/:id_partition/:basename-:style.:extension"
  end  
  
    version :thumb do
      process :resize_to_fit => [100, 100]
  #    process resize_to_fit: [100, 100]
    end
    version :large do
      process :resize_to_limit =>[800, 800] 
    end

end
