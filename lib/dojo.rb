require 'class_structure'
require 'class_validator'
require 'rules'

class Dojo
  def initialize(dir, file_filter = "**/*.rb")
    @dir = dir
    @file_filter = file_filter
  end
  
  def validate
    Dir.glob("#{@dir}/#{@file_filter}").each do |file|
      ClassValidator.new(file).validate
    end
  end
end