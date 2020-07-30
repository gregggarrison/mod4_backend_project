class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :sex, :height, :weight, :meals
end
