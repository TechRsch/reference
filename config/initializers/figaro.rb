Figaro::Tasks::Heroku.module_eval do
      def vars
        Figaro.env(environment).map { |key, value|
          if value.start_with? "["
            value = "'#{value.gsub('"', '')}'"
          elsif value.include? " "
            value = "'#{value}'"
          end
          "#{key}=#{value}"
        }.sort.join(" ")
    end
end
