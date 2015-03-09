# encoding: utf-8
class FileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  include CarrierWave::MimeTypes
  # include CarrierWave::MiniMagick
  
  # Call method
  process :set_content_type

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  CarrierWave.configure do |config|
    config.root = Rails.root
  end
   
     def cache_dir
        "#{Rails.root}/public/uploads"
     end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png pdf wmv mov avi mp4)
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  #def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end



  # Create different versions of your uploaded files:
  version :thumb, :if => :image? do
    process :resize_to_limit => [150, 150]
  end
  # version :thumb, :if => :video? do
  #   process thumbnail: [{format: 'png', quality: 10, size: 192, strip: true, logger: Rails.logger}]
  
  # def full_filename for_file
  #     png_name for_file, version_name
  # end

  # def png_name for_file, version_name
  #   %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  # end






  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


protected
    def image?(new_file)
      return model.is_image unless model.is_image.nil?
      model.is_image = \
        begin
          new_file.content_type.start_with? 'image'
        end
    end
    # def video?(new_file)
    #   return model.is_video unless model.is_video.nil?
    #   model.is_thumbnable = \
    #     begin
    #       new_file.content_type.start_with? 'video'
    #     end
    # end
    # def pdf?(new_file)
    #   return model.is_image unless model.is_image.nil?
    #   model.is_thumbnable = \
    #     begin
    #       new_file.content_type.start_with? 'image'
    #     end
    # end
end
