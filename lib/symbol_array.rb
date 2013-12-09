class SymbolArray < Array

  class << self

    def load(string)
      return string.to_s.strip.split(/[[:space:]]*\,[[:space:]]*/)
    end

    def dump(array)
      return [array].flatten.map(&:to_s).sort.join(', ')
    end

  end

end
