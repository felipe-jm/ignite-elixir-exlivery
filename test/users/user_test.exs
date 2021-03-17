defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua 35",
          21,
          "12312312312",
          "felipe@gmail.com",
          "Felipe"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Rua 35",
          17,
          "12312312312",
          "felipe@gmail.com",
          "Felipe Junior"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
