class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :scientist
  has_one :planet
  belongs_to :scientist, serializer: ScientistWithMissionsSerializer
end
