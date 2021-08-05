require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :default_url
  #plugin :processing
  #plugin :versions
  plugin :validation
  plugin :validation_helpers
  plugin :derivatives

  Attacher.validate do
    validate_extension %w[ jpeg jpg jpe jfif png webp gif tiff bmp ]
    validate_mime_type %w[ image/jpeg image/png image/webp image/gif image/pjpeg image/svg+xml image/tiff ]
    validate_max_size 10.megabyte, message: 'The file is too large. Maximum size is 10 Mb'
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    { thumbnail: magick.resize_to_limit!(300, nil),
      big_thumbnail: magick.resize_to_limit!(1000, nil)
    }
  end
=begin
  process(:store) do |io, context|
    original = io.download

    thumbnail = ImageProcessing::MiniMagick
                  .source(original)
                  .resize_to_limit!(300, nil)
    big_thumbnail = ImageProcessing::MiniMagick
                      .source(original)
                      .resize_to_limit!(1000, nil)

    original.close!

    { original: io, thumbnail: thumbnail, big_thumbnail: big_thumbnail }
    end
=end

 Attacher.default_url do |**options|
     'no_image_available.jpeg'
   end
end