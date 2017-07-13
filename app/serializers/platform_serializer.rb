class PlatformSerializer < ActiveModel::Serializer
  attributes :id, :name, :licence, :api_key, :comment
end
