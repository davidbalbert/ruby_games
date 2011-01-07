class KeyCodeGenerator
  ValidChars = "abcdefghijkmnpqrstuvwxy3456789".split(//)
  Base = ValidChars.size

  def self.generate
    results = {}

    while results.size < 5000 do
      results[generate_key] = true
    end

    results.keys
  end

  # not used yet
  def self.sequential_generate
    5000.times do |i|
    end
  end

  def self.generate_key
    key = ""
    6.times do
      key << ValidChars[rand(Base)]
    end
    key
  end

end
