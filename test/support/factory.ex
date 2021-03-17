defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Felipe",
      email: "felipe@gmail.com",
      cpf: "12312312312",
      age: 21,
      address: "Rua 35"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de queijo",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
