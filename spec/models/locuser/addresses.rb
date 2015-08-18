
require 'locuser/locality'

module Locuser

  class TestOwnerAddress < Locuser::Location
    include Mongoid::Document
    include Locuser::SpecBase
    include Locuser::OwnerStreetAddress

  end   # class TestOwnerAddress

  class TestStreetAddress < Locuser::Location
    include Mongoid::Document
    include Locuser::SpecBase
    include Locuser::StreetAddress

  end   # class TestStreetAddress

  class TestAddressOwner
    include Mongoid::Document
    include Locuser::StreetAddress
  end

end # module Places
