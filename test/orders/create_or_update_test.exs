defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "call/1" do
    setup do
      cpf = "12312312312"
      user = build(:user, cpf: cpf)

      Exlivery.start_agents()
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza de queijo",
        quantity: 1,
        unity_price: "35.50"
      }

      item2 = %{
        category: :pizza,
        description: "Pizza de calabresa",
        quantity: 1,
        unity_price: "30.00"
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{
        user_cpf: cpf,
        items: [item1, item2]
      }

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns and error", %{
      item1: item1,
      item2: item2
    } do
      params = %{
        user_cpf: "00000000000",
        items: [item1, item2]
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end

    test "when there are invalid items, returns an error", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{
        user_cpf: cpf,
        items: [%{item1 | quantity: 0}, item2]
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid items"}

      assert response == expected_response
    end

    test "when there are no items, returns an error", %{
      user_cpf: cpf
    } do
      params = %{
        user_cpf: cpf,
        items: []
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
