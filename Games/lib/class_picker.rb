class ClassPicker
  class << self

    def descriptions
      class_map.values.each_with_index do |klass, idx|
        puts "(#{idx + 1}) #{klass.fancy_name} - #{klass.description}"
      end
    end

    def pick_class(idx)
      class_name = class_map.keys[idx.to_i - 1]
      class_map[class_name]
    end

    def class_map
      Dir.entries(class_path)[2..-1].inject({}) do |map, filename|
        # Ugh, don't load vim swap files
        return map if filename.match(/^\..+\.swp$/)
        class_name = filename.gsub(".rb", "").capitalize
        map[class_name] = const_get(class_name) if const_defined?(class_name)
        map
      end
    end

    def class_path
      "#{lib_path}/classes"
    end

    def lib_path
      File.expand_path(File.dirname(__FILE__))
    end

  end
end
