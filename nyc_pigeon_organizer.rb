def nyc_pigeon_organizer(data)
  new_names = {}

  # First we're iterating over the top level hash—data, aka pigeon_data
  # .map means the results of this will spit out a new hash
  data.map do |categories_key, specification_hash|
    # Then I need to get a level deeper—this one will pass its results to map
    specification_hash.each do |specification_key, pigeon_names_array|
      #Even a level deeper, to the most nested level, which contains an array
      pigeon_names_array.each do |name|
        #Extract each index of the pigeon names array
        #Push it into a new hash—at which point it will only have keys, and no values
        new_names[name] ||= {}
        new_names[name][categories_key] ||= []
        new_names[name][categories_key] << specification_key.to_s
        #So now new_names is just the names, in a hash, each with an empty hash
      end
    end
  end

  #Finally, I'm going to spit out my completed new hash
  new_names
end
