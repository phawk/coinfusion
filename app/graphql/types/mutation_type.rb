module Types
  class MutationType < Types::BaseObject
    field :login, Types::AccountType, null: false, mutation: Mutations::Login
    field :register, Types::AccountType, null: false, mutation: Mutations::Register
  end
end
