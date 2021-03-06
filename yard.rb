# This file is used to build the yard documentation only as yard cannot currently
# generate ruby documentation from C++ files.
# The source code for this extension can be found in ext/rb_lovely.

# Contains sorted container implementations.
# @author nuisanceofcats
module RbLovely

  # Implement a sorted set with no duplicates where values are compared and sorted using the <=> operator on each member.
  # @note
  #   A SortedSet should not be modified during iteration.
  #
  #   Some methods come from the {http://www.ruby-doc.org/core-2.1.2/Enumerable.html Enumerable} module. If you do not find the method you are looking for in this documentation then please look there.
  #
  # @author nuisanceofcats
  # @example
  #   class Person < Struct.new(:name, :age)
  #     def <=> other
  #       return age - other.age
  #     end
  #   end
  #
  #   empty_set = RbLovely::SortedSet.new
  #
  #   set = RbLovely::SortedSet [Person.new('Nyamuk', 2), Person.new('Cold Rain', 9999)]
  #   set.add Person.new('Beards', 15)
  #   set << Person.new('Anna', 12)
  #   set.add Person.new('Moust', 18)
  #   expect(set.first.name).to equal 'Nyamuk'
  #   expect(set.last.name).to equal 'Cold Rain'
  #   expect(set.length).to equal 5
  #
  #   # Gond isn't added because <=> returns 0 for him and Anna
  #   set.add Person.new('Gond', 12)
  #   expect(set.length).to equal 5
  class SortedSet
    include Enumerable

    # @param content [Array] An array of values to insert into the set.
    # @complexity O(n).
    # @example
    #   set = RbLovely::SortedSet.new [3,1,2]
    #   expect(set.to_a).to eql [1,2,3]
    def initialize content = [] ; end

    # Factory method for creating sorted set from array.
    # @complexity O(n).
    # @param content [Array] An array of values to insert into the created set.
    # @return [SortedSet] New sorted set instance.
    # @example
    #   set = RbLovely::SortedSet [3,1,2]
    #   expect(set.to_a).to eql [1,2,3]
    def self.[](*content) ; end

    # Deletes first member equivalent to value.
    # @complexity O(log(n)).
    # @return The value that was removed or nil if no value was removed.
    # @param value Value to remove (each member is compared to value using the <=> method).
    # @example
    #   set = RbLovely::SortedSet [1, 5, 3]
    #   set.delete 3
    #   expect(set.to_a).to eql [1, 5]
    def delete value ; end

    # Access the first element in the set.
    # @complexity O(c).
    # @return The first value according to the <=> method defined on each member.
    # @example
    #   set = RbLovely::SortedSet [4, 0, 2]
    #   expect(set.first).to equal 0
    def first ; end

    # Access the last element in the set.
    # @complexity O(c).
    # @return The last value according to the <=> method defined on each member.
    # @example
    #   set = RbLovely::SortedSet [4, 0, 2]
    #   expect(set.last).to equal 4
    def last ; end

    # Remove the first element from the set.
    # @complexity O(c).
    # @see #pop
    # @return The first value according to the <=> method defined on each member or nil if the set is empty.
    # @example
    #   set = RbLovely::SortedSet [4, 0, 2]
    #   expect(set.shift).to equal 0
    def shift ; end

    # Remove the last element from the set.
    # @complexity O(c).
    # @see #shift
    # @return The last value according to the <=> method defined on each member or nil if the set is empty.
    # @example
    #   set = RbLovely::SortedSet [4, 0, 2]
    #   expect(set.pop).to equal 4
    def pop ; end

    # Remove elements from the set match a given predicate.
    # @complexity O(n)
    # @param predicate Items are removed from the set for which predicate returns true.
    # @example
    #   set = RbLovely::SortedSet [0, 1, 2, 3]
    #   set.reject!(&:odd?)
    #   expect(set.to_a).to eql([0, 2])
    def reject!(&predicate) ; end

    # Remove the first element from the set that matches the given predicate.
    # @complexity O(log n)
    # @param predicate The first item is removed which predicate returns true for.
    # @example
    #   set = RbLovely::SortedSet [0, 1, 2, 3]
    #   set.reject!(&:odd?)
    #   expect(set.to_a).to eql([0, 2, 3])
    def reject_first!(&predicate) ; end

    # Remove elements from the set that do not match a given predicate.
    # @complexity O(n)
    # @param predicate Items are removed from the set for which predicate does not return true.
    # @example
    #   set = RbLovely::SortedSet [0, 1, 2, 3]
    #   set.select!(&:odd?)
    #   expect(set.to_a).to eql([1, 3])
    def select!(&predicate) ; end

    # Calls block once with each value in the set.
    # @complexity O(n)
    # @example
    #   set = RbLovely::SortedSet [0, 1, 2, 3]
    #   set.each { |x| puts x }
    def each(&block) ; end

    # Gets the number of elements in the set.
    # @complexity O(c).
    # @return [Number] Number of items in set.
    def length ; end

    # Return true if the set is empty.
    # @complexity O(c).
    # @return [Boolean] True only if the set is empty else false.
    def empty? ; end
  end


  # A SortedHash provides hashed unique keys and ordered non-unique values. Values are sorted using "<=>" and keys are tested for equality using "eql?".
  # @note
  #   A SortedHash should not be modified during iteration.
  #
  #   This class is only provided if boost is available on the system when the gem is installed as it is built using the {http://www.boost.org/doc/libs/1_56_0/libs/multi_index/doc/index.html Boost Multi-index Containers Library}.
  #
  #   Some methods come from the {http://www.ruby-doc.org/core-2.1.2/Enumerable.html Enumerable} module. If you do not find the method you are looking for in this documentation then please look there.
  # @author nuisanceofcats
  # @example
  #   empty_hash = RbLovely::SortedHash.new
  #
  #   # constructor is like: hash[:y] = 5 ; hash[:i] = 1
  #   hash = RbLovely::SortedHash [:y, 5, :i, 1]
  #   hash[:b] = 16
  #   hash[:y] = 4 # updates previous value
  #   expect(hash.first).to equal [:i, 1]
  #   expect(hash[:y]).to equal 4
  #   expect(hash.length).to equal 3
  #   expect(hash.to_a).to eql [[:i, 1], [:y, 4], [:b, 16]]
  #
  #   # reverse order by overriding key comparison function.
  #   rhash = RbLovely::SortedHash(compare: proc { |a, b| b <=> a })
  class SortedHash
    include Enumerable

    # @complexity O(n).
    # @see .[]
    # @param content [Array] An array containing key, value, key, value ...
    # @param compare [Proc] Comparison function used to order values (rather than default
    #                       of using <=> method).
    # @example
    #   hash = RbLovely::SortedHash.new [:a, 10, :c, 5, :b, 1 ]
    #   expect(hash.to_a).to eql [[:b, 1], [:c, 5], [:a, 10]]
    #
    #   # compare function reverses default sort order
    #   hash = RbLovely::SortedHash.new(compare: proc { |a, b| b <=> a })
    #   hash[:a] = 1
    #   hash[:c] = 5
    #   hash[:b] = 10
    #   expect(hash.to_a).to eql [[:b, 10], [:c, 5], [:a, 1 ]]
    def initialize content = [], compare: nil ; end

    # Factory method for creating sorted hash from array.
    # @complexity O(n).
    # @param content [Array] An array of values to insert into the created hash.
    # @return [SortedHash] New sorted set instance.
    # @example
    #   hash = RbLovely::SortedHash [:a, 3, :b, 1]
    #   expect(hash.to_a).to eql [[:b, 1], [:a, 3]]
    def self.[](*content) ; end

    # Set the value associated with a key, replacing the existing key's value.
    # @complexity O(c).
    # @see #replace
    # @return The value that was passed.
    # @example
    #   hash = RbLovely::SortedHash.new
    #   hash[:a] = 'yo'
    def []=(key, value) ; end

    # Set the value associated with a key, differs to #[]= in return value.
    # @complexity O(c).
    # @see #[]=
    # @return The value that was previously associated with the key or nil if the key was not present in the hash.
    # @example
    #   hash = RbLovely::SortedHash[:a, 'yi']
    #   expect(hash.replace(:a, 'yo')).to eql('yi')
    #   expect(hash.replace(:b, 'hm')).to eql(nil)
    def replace(key, value) ; end

    # Delete the value associated with a key.
    # @complexity O(c)
    # @return The value associated with the deleted key or nil if the key was not in the hash.
    # @example
    #   hash = RbLovely::SortedHash [:a, 5]
    #   expect(hash.delete(:a)).to equal 5
    #   expect(hash.delete(:b)).to equal nil
    def delete key ; end

    # Calls block once for each key, passing the key-value pair as parameters.
    # @complexity O(n)
    # @example
    #   hash = RbLovely::SortedHash [:a, 10, :b, 1]
    #   # This would call the block in value order: with (:b, 1) followed by (:a, 10).
    #   hash.each { |key, value| puts "#{key} => #{value}" }
    def each(&block) ; end

    # Remove all key-value pairs from the hash.
    # @complexity O(n)
    # @example
    #   hash = RbLovely::SortedHash [:a, 10]
    #   hash.clear
    #   expect(hash.empty?).to equal true
    def clear ; end

    # Retrieve value from hash using key.
    # @return Value associated with the corresponding key or nil if the key doesn't exist.
    # @complexity O(c)
    # @example
    #   hash = RbLovely::SortedHash [:a, 2]
    #   expect(hash[:a]).to equal 2
    #   expect(hash[:b]).to equal nil
    def [](key) ; end

    # Return true if the key is contained in the hash.
    # @complexity O(c)
    def include?(key) ; end
    alias :has_key? :include?
    alias :key? :include?

    # Retrieve first key-value pair as determined by value sort order or nil if the hash is empty.
    # @complexity O(c)
    # @example
    #   @set = RbLovely::SortedHash [:a, 2, :b, 1]
    #   expect(@set.first).to eql [:b, 1]
    def first ; end

    # Retrieve first value as determined by value sort order or nil if the hash is empty.
    # @complexity O(c)
    # @return [Array] The first key-value pair in the hash.
    # @example
    #   @set = RbLovely::SortedHash [:a, 2, :b, 1]
    #   expect(@set.first_value).to equal 1
    def first_value ; end

    # Retrieve first key as determined by value sort order or nil if the hash is empty.
    # @complexity O(c)
    # @return The first key in the hash
    # @example
    #   @set = RbLovely::SortedHash [:a, 1, :b, 2]
    #   expect(@set.first_key).to equal :a
    def first_key ; end

    # Retrieve last key-value pair as determined by value sort order or nil if the hash is empty.
    # @complexity O(c)
    # @return [Array] The last key-value pair in the hash.
    # @example
    #   @set = RbLovely::SortedHash [:a, 2, :b, 1]
    #   expect(@set.last).to equal [:a, 2]
    def last ; end

    # Retrieve last value as determined by value sort order or nil if the hash is empty.
    # @complexity O(c)
    # @example
    #   @set = RbLovely::SortedHash [:a, 2, :b, 1]
    #   expect(@set.last_value).to equal 2
    def last_value ; end

    # Retrieve last key as determined by value sort order or nil if the hash is empty.
    # @complexity O(c)
    # @example
    #   @set = RbLovely::SortedHash [:a, 1, :b, 2]
    #   expect(@set.last_key).to equal :b
    def last_key ; end

    # Remove the first key-value pair in the hash and return it or return nil if the hash is empty.
    # @complexity O(c).
    # @see #pop
    # @return [Array] The first key-value pair according to the <=> method defined on each member or nil if the hash is empty.
    # @example
    #   set = RbLovely::SortedHash [:a, 2, :b, 10]
    #   expect(hash.shift).to equal [:a, 2]
    def shift ; end

    # Remove the first key-value pair in the hash and return the value or return nil if the hash is empty.
    # @complexity O(c).
    # @see #pop_value
    # @return The first key pair according to the <=> method defined on each member or nil if the hash is empty.
    # @example
    #   set = RbLovely::SortedHash [:a, 2, :b, 10]
    #   expect(hash.shift_value).to equal 2
    def shift_value ; end

    # Remove the first key-value pair in the hash and return the key or return nil if the hash is empty.
    # @complexity O(c).
    # @see #pop_key
    # @return The first key pair according to the <=> method defined on each member or nil if the hash is empty.
    # @example
    #   set = RbLovely::SortedHash [:a, 2, :b, 10]
    #   expect(hash.shift_key).to equal :a
    def shift_key ; end

    # Remove the last key-value pair in the hash and return it or return nil if the hash is empty.
    # @complexity O(c).
    # @see #shift
    # @return [Array] The last key-value pair according to the <=> method defined on each member or nil if the hash is empty.
    # @example
    #   set = RbLovely::SortedHash [:a, 2, :b, 10]
    #   expect(hash.pop).to equal [:b, 10]
    def pop ; end

    # Remove the last key-value pair in the hash and return the value or return nil if the hash is empty.
    # @complexity O(c).
    # @see #shift_value
    # @return The last key according to the <=> method defined on each member or nil if the hash is empty.
    # @example
    #   set = RbLovely::SortedHash [:a, 2, :b, 10]
    #   expect(hash.pop_value).to equal 10
    def pop_value ; end

    # Remove the last key-value pair in the hash and return the key or return nil if the hash is empty.
    # @complexity O(c).
    # @see #shift_key
    # @return The last key according to the <=> method defined on each member or nil if the hash is empty.
    # @example
    #   set = RbLovely::SortedHash [:a, 2, :b, 10]
    #   expect(hash.pop_key).to equal :b
    def pop_key ; end

    # Gets the number of elements in the hash.
    # @complexity O(c).
    # @return [Number] Number of items in hash.
    def length ; end

    # Return true if the hash is empty.
    # @complexity O(c).
    # @return [Boolean] True only if the hash is empty else false.
    def empty? ; end
  end
end
