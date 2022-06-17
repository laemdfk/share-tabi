class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "EndUser"
  belongs_to :followed, class_name: "EndUser"   # class nameで「存在しないモデル"follow"」の参照を防ぐ
  
end
