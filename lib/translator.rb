# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  new_hash = {}
  
  emoticons = YAML.load_file(file_path)
  emoticons.each do |emoticon, symbols|
    new_hash[emoticon] ||= {}
    new_hash[emoticon][:english] = symbols[0]
    new_hash[emoticon][:japanese] = symbols[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here
  
  new_hash = load_library(file_path)
  
  new_hash.each do |emoticon_name, languages|
    if english_emoticon == languages[:english]
      return languages[:japanese]
    end 
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here

  new_hash = load_library(file_path)
  
  new_hash.each do |emoticon_name, languages|
    if japanese_emoticon == languages[:japanese]
      return emoticon_name
    end 
  end
  return "Sorry, that emoticon was not found"
end