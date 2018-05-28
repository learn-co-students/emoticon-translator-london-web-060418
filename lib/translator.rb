require "yaml"


def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  new_hash = {"get_meaning" => {},
              "get_emoticon" => {}
            }
  emoticons.each do |meaning, data|
    new_hash["get_meaning"].store(data[1], meaning)
    new_hash["get_emoticon"].store(data[0], data[1])
  end
  return new_hash
end

def get_japanese_emoticon(filepath, emoticon)
  dictionary = load_library(filepath)
  if dictionary["get_emoticon"].has_key?(emoticon)
    return dictionary["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filepath, emoticon)
  dictionary = load_library(filepath)
  if dictionary["get_meaning"].has_key?(emoticon)
    return dictionary["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
