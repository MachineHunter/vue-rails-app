class Practice < ApplicationRecord
  has_one_attached :image
  attr_accessor :img
  
  def image=(img)
    if img.present?
      prefix = img[/(img|application)(\/.*)(?=\;)/]
      type = prefix.sub(/(img|application)(\/)/, '')
      data = Base64.decode64(img.sub(/data:#{prefix};base64,/, ''))
      filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(data)
      end
      image.detach if image.attached?
      image.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  end
end
