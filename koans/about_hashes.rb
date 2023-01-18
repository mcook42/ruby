require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal Hash, empty_hash.class
    assert_equal({}, empty_hash)
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal "uno", hash[:one]
    assert_equal "dos", hash[:two]
    assert_equal nil, hash[:doesnt_exist]
  end

  def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal "uno", hash.fetch(:one)
    assert_raise(KeyError) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
    # Ans:
    # with fetch you are able to avoid nil checks on the return value and let the KeyError bubble up to the calling function
    # so that the caller can define the behavior of a Key Value pair
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => "eins", :two => "dos" }
    assert_equal expected, hash

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal true, hash1 == hash2
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.keys.size
    assert_equal true , hash.keys.include?(:one)
    assert_equal true , hash.keys.include?(:two)
    assert_equal Array, hash.keys.class
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.values.size
    assert_equal true, hash.values.include?("uno")
    assert_equal true, hash.values.include?("dos")
    assert_equal Array, hash.values.class
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal true, hash != new_hash

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
    # The last value to be added to the merged hash overwrites the previous object with the same key (why it's jim 54 not jim 53)
    assert_equal true, expected == new_hash
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal 1, hash1[:one]
    assert_equal nil, hash1[:two]

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal 1, hash2[:one]
    assert_equal "dos", hash2[:two]
    # hash2[:two] returns "dos" because "dos" is the default value for this hash. By creating a new hash without a block
    # (with block: Hash.new({:two : "dos"}) | without block Hash.new("dos")) the value provided becomes the default value
    # for the hash object.
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    answer_to_all = ["uno", "dos"]
    assert_equal answer_to_all, hash[:one]
    # since neither :one or :two are exist with associated values prior to the << append, the "uno" and "dos" values
    # get appended to the DEFAULT value.  So when we query for :one or :two we will get the default values since neither
    # key has a value associated with it
    assert_equal answer_to_all, hash[:two]
    assert_equal answer_to_all, hash[:three]

    assert_equal true, hash[:one].object_id == hash[:two].object_id
    # true because they're both getting the default value (see explanation above)
  end

  def test_default_value_with_block
    # https://stackoverflow.com/a/19757193 is helpful for understanding what happens with the shovel operator
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"
    # since we initialize the has as a list on line 120 above, the shovel operator is able to append the key-value pairs
    # for the symbol-value pairs above unlike before. This is because the shovel operator appends values to the ends of
    # arrays, we already have the array initialized, so we can add the key-value pairs at the end. Wow what a description
    # I hope future me understands because it's a tough one to explain without doing what the stackoverflow user did to
    # answer the question

    assert_equal ["uno"], hash[:one]
    assert_equal ["dos"], hash[:two]
    assert_equal [], hash[:three]
  end
end
