class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :password_digest
  has_many :chores
end
