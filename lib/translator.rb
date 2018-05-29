# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emojis = YAML.load_file(file_path)
  emoji_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emojis.each do |meaning, smileys|
    emoji_hash["get_meaning"][smileys[1]] = meaning
    emoji_hash["get_emoticon"][smileys[0]] = smileys[1]
  end
  return emoji_hash
end

def get_japanese_emoticon(file_path, emoji)
  emoji_dictionary = load_library(file_path)
  if emoji_dictionary["get_emoticon"].include?(emoji)
    return emoji_dictionary["get_emoticon"][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoji)
  emoji_dictionary = load_library(file_path)
  if emoji_dictionary["get_meaning"].include?(emoji)
    return emoji_dictionary["get_meaning"][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end