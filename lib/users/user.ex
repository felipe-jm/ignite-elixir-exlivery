defmodule Exlivery.Users.User do
  @keys [:address, :age, :cpf, :email, :name]
  @enforce_keys @keys

  defstruct @keys

  def build(address, age, cpf, email, name) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       address: address,
       age: age,
       cpf: cpf,
       email: email,
       name: name
     }}
  end

  def build(_address, _age, _cpf, _email, _name), do: {:error, "Invalid parameters"}
end
