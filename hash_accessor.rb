# given a key-value hash {:dog => "bark"}
# store the key such that when you call :dog without
# using a hash, "bark" is returned


class HashAccessor

  def initialize(key, value)
    @key = key
    @value = value
    @value_array = Array.new
  end

  def store(key, value)
    array_position = storage_number_generator(key)
    @value_array.insert(array_position, value)
    @value_array
  end

  def access_key(key)
    array_position = storage_number_generator(key)
    @value_array[array_position]
  end

  private

  def storage_number_generator(key)
    key.object_id % 5
    # IRL this should return an initially unique number for a given key,
    # but should always return that same unique number for the same unique key
    # this is just proof of concept
  end

end
