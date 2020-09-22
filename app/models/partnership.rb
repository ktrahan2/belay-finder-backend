class Partnership < ApplicationRecord
    belongs_to :requestor, class_name: :User
    belongs_to :receiver, class_name: :User

    validates  :requestor_id, :receiver_id, presence: true

end
