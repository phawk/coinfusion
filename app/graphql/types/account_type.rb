# frozen_string_literal: true

module Types
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :account_type, Types::AccountTypeType, null: false
    field :name, String, null: false
    field :company_number, String
    field :date_of_birth, GraphQL::Types::ISO8601Date
    field :email, String, null: false
    field :token, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
