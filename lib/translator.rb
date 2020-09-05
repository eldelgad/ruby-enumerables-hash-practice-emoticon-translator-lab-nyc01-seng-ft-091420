require 'yaml'
require 'pry'

def load_library(emote_file)
  emojis = YAML.load_file(emote_file)
  hash = {}
  
  emojis.each do |key, value|
    hash[key] = {}
    hash[key][:english] = value[0]
    hash[key][:japanese] = value[1]
  end
  
  hash
  
end

# binding.pry

def get_japanese_emoticon(emote_file, emojis)
  library = load_library(emote_file)

  emojis = library.keys.find do |key|
    
    library[key][:english] == emojis
    
  end
  
  if emojis = library[emojis][:japanese]
    # binding.pry
    emojis
  else
    p "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(emote_file, emojis)
  library = load_library(emote_file)
  
  emojis = library.keys.find do |key|

    library[key][:japanese] == emojis
    
  end
  
  if emojis = emojis
    emojis
  else
    p "Sorry, that emoticon was not found"
  end
  
end