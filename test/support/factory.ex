defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
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

  def order_factory do
    %Order{
      delivery_address: "Rua 35",
      items: [
        build(:item),
        build(:item,
          description: "Risoto com queijo",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("30.50")
        )
      ],
      total_price: Decimal.new("96.50"),
      user_cpf: "12312312312"
    }
  end
end
