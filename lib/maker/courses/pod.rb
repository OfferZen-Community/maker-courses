require 'active_attr'

module Maker
  module Courses
    class Pod
      include ActiveAttr::Model
      attribute :id
      attribute :repo
      attribute :summary
      attribute :is_prep
      attribute :prerequisites
    end
  end
end
