module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    private

     def current_account
       context[:current_account]
     end

     def authenticate!
       if current_account.blank?
         raise GraphQL::ExecutionError, "Authentication failed, you must be signed in!"
       end
     end
  end
end
