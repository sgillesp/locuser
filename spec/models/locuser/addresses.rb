
module Locuser

  class TestOwnerAddress < Locuser::StreetAddress
    include Mongoid::Document
    include Locuser::SpecBase
    include Locuser::OwnerStreetAddress
  end   # class TestOwnerAddress

  class TestHashedAddress < Locuser::StreetAddress
    include Mongoid::Document
    include Locuser::SpecBase
    include Locuser::HashedAddress
  end   # class TestStreetAddress

  class TestAddressOwner
    include Mongoid::Document
    include Taxonomite::Entity

    attr_accessor :street
    attr_accessor :city
    attr_accessor :state
    attr_accessor :postal_code

  end   # class TestAddressOwner

end # module Places
