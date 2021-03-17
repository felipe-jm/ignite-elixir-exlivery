defmodule Exlivery.Factory do
  use ExMachina

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
end
