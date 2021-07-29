class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp image/gif image/pjpeg image/svg+xml image/tiff]
    validate_max_size 10.megabyte, message: 'The file is too large. Maximum size is 10 Mb'
  end
end