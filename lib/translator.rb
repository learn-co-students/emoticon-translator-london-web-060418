# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticon_file_read = YAML.load_file(file_path)

  return_hash = { "get_meaning" => {}, "get_emoticon" => {} }

  emoticon_file_read.each do |key_meaning, values|
    return_hash["get_meaning"][values[1]] = key_meaning
    return_hash["get_emoticon"][values[0]] = values[1]
   end

  return return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library_file = load_library(file_path)
  emoticon_found = library_file["get_emoticon"][emoticon]

  return emoticon_found == nil ? "Sorry, that emoticon was not found" : emoticon_found
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library_file = load_library(file_path)
  emoticon_found = library_file["get_meaning"][emoticon]

  return emoticon_found == nil ? "Sorry, that emoticon was not found" : emoticon_found
end
