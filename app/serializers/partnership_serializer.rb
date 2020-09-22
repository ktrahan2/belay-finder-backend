class PartnershipSerializer
  include FastJsonapi::ObjectSerializer
  attributes :requestor_id, :receiver_id, :requestor, :receiver, :status
end
