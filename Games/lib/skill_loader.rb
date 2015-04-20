module SkillLoader
  def self.included(base)
    base.extend ClassMethods

    skill_dir = "#{base.name.downcase}_skills"
    Dir.entries("./lib/#{skill_dir}")[2..-1].each do |filename|
      next if filename.match(/^\..+\.swp$/)
      require_relative "./#{skill_dir}/#{filename}"
      skill_name = filename.gsub("\.rb", "")
      class_name = skill_name.split("_").map do |word|
        word.capitalize
      end.join

      base.class_eval <<-SKILL
        register_skill(#{class_name}, :#{skill_name})
        def #{skill_name}
          #{class_name}.new(self).run
        end
      SKILL
    end
  end

  def action
    question = <<-QUESTION

On guard! What would you like to do?
=================================

    QUESTION

    AskQuestion.multiple_choice(question, actions, self)
  end

  def actions
    available_skills = {
      "Attack with all your might!" => method(:attack),
    }

    self.class.skills.each do |klass, skill_name|
      available_skills[klass.description] = method(skill_name) if klass.cost < @mp && !affected_by?(skill_name)
    end

    available_skills
  end

  module ClassMethods
    def skills
      @skills
    end

    def register_skill(klass, skill_name)
      @skills ||= {}
      @skills[klass] = skill_name
    end
  end
end
