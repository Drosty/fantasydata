module Fantasydata
  class Base
    # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
    #
    # @param attrs [Array, Set, Symbol]
    def self.attr_reader(*attrs)
      #@attr_readers ||= []
      #@attr_readers.concat attrs
      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attrs[attribute.to_sym] if @attrs
          end
          define_method "#{attribute}?" do
            !!@attrs[attribute.to_sym]
          end
        end
      end
      const_set(:Attributes, mod)
      include mod
    end

    # @param other [Fantasydata::Base]
    # @return [Boolean]
    def ==(other)
      super || attr_equal(:id, other) || attrs_equal(other)
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Fantasydata::Base]
    def initialize(attrs={})
      new_attrs = {}
      attrs = {} if attrs.nil?
      attrs.to_hash.each_pair do |k,v|
        new_attrs.merge!({underscore_key(k) => v})
      end
      @attrs = new_attrs
    end

    # Retrieve the attributes of an object
    #
    # @return [Hash]
    def attrs
      @attrs
    end
    alias to_hash attrs

    # Update the attributes of an object
    #
    # @param attrs [Hash]
    # @return [Fantasydata::Base]
    def update(attrs)
      @attrs.update(attrs)
      self
    end

  protected

    def underscore_key(str)
      str.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase.to_sym
    end

    # @param attr [Symbol]
    # @param other [Fantasydata::Base]
    # @return [Boolean]
    def attr_equal(attr, other)
      self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
    end

    # @param other [Fantasydata::Base]
    # @return [Boolean]
    def attrs_equal(other)
      self.class == other.class && !other.attrs.empty? && attrs == other.attrs
    end

    # @param klass [Class]
    # @param key [Symbol]
    # @return [Array]
    def map_collection(klass, key)
      Array(@attrs[key.to_sym]).map do |entity|
        klass.new(entity)
      end
    end

  end
end
