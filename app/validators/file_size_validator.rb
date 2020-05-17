class FileSizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    file_megabytes = value / 1.megabytes.to_f
    record.errors[attribute] << (options[:message] || "file size must be under #{options[:max_megabytes]}") if file_megabytes > options[:max_megabytes]
  end
end
