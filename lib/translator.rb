# require modules here
require "pry"
require 'yaml'

def load_library(address)
  # code goes here
  return_hash = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(address).each do |key, value|
    english = value[0]
    japanese = value[1]
    return_hash["get_meaning"][japanese] = key
    return_hash["get_emoticon"][english] = japanese
  end
  return_hash

end

def get_japanese_emoticon(library, emoticon)
  library_loaded = load_library(library)
  library_loaded["get_emoticon"].each do |k, v|
    if k == emoticon
      return v
    end
  end
  sorry_message
  # code goes here
end

def get_english_meaning(library, emoticon)
  library_loaded = load_library(library)
  library_loaded["get_meaning"].each do |k, v|
    if k == emoticon
      return v
    end
  end
  sorry_message
  # code goes here
end

def sorry_message
  "Sorry, that emoticon was not found"
end
