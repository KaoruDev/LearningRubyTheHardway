class Utils
  def self.available_classes

  end

  private

  def self.class_path
    "#{lib_path}/classes"
  end

  def self.lib_path
    File.expand_path(File.dirname(__FILE__))
  end
end

