module Stupidedi

  module Sets
    autoload :AbstractSet,        "stupidedi/sets/abstract_set"
    autoload :AbsoluteSet,        "stupidedi/sets/absolute_set"
    autoload :NullSet,            "stupidedi/sets/null_set"
    autoload :RelativeComplement, "stupidedi/sets/relative_complement"
    autoload :RelativeSet,        "stupidedi/sets/relative_set"
    autoload :UniversalSet,       "stupidedi/sets/universal_set"
  end

  class << Sets
    # @group Constructors
    ###########################################################################

    # @return [Sets::AbstractSet]
    def build(object)
      if object.is_a?(Sets::AbstractSet)
        object
      elsif object.is_a?(Enumerable)
        Sets::RelativeSet.build(object)
      else
        raise TypeError,
          "argument must be an AbstractSet or Enumerable"
      end
    end

    # @return [Sets::AbstractSet]
    def complement(other)
      build(other).complement
    end

    # @return [Sets::UniversalSet]
    def universal
      Sets::UniversalSet.build
    end

    # @return [Sets::NullSet]
    def empty
      Sets::NullSet.build
    end

    # @return [Sets::AbsoluteSet]
    def absolute(other, universe = other)
      if universe.eql?(other)
        Sets::AbsoluteSet.build(universe)
      else
        Sets::AbsoluteSet.build(universe).intersection(other)
      end
    end

    # @endgroup
    ###########################################################################
  end


end
