class Colors
  {
    :red => 31,
    :green => 32,
    :yellow => 33,
    :blue => 34,
    :magenta => 35,
    :cyan => 36
  }.each do |color_name, color_code|
    self.instance_eval <<-INSTANCE_METH
      def self.#{color_name}(str)
        generate_color(#{color_code}, str)
      end
    INSTANCE_METH
  end

  class << self
    private

    def generate_color(color_code, str)
      "\033[#{color_code}m#{str}\033[0m"
    end
  end
end

