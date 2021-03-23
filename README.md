<h1 align="center">
    <img width="120" alt="Ignite" src="https://res.cloudinary.com/dqcqifjms/image/upload/v1615216700/felipejung/ignite.png" />
    <br>
    Ignite - Elixir - Exlivery
</h1>

<h4 align="center">
  A application for deliveries management
</h4>

## :information_source: How To Use

```bash
iex -S mix

# Create user params
iex(1)> user_params = %{name: "Felipe", email: "felipe@gmail.com", cpf: "12312312312", address: "Rua tal", age: 21}
%{
  address: "Rua tal",
  age: 21,
  cpf: "12312312312",
  email: "felipe@gmail.com",
  name: "Felipe"
}

# Start agents to save the states
iex(2)> Exlivery.start_agents()
{:ok, #PID<0.279.0>}

# Create user
iex(3)> Exlivery.create_or_update_user(user_params)
{:ok, "User created or updated successfully"}

# Create items params
iex(4)> items_params = [%{description: "Pizza de frango", category: :pizza, unity_price: 35.50, quantity: 1}]
[
  %{
    category: :pizza,
    description: "Pizza de frango",
    quantity: 1,
    unity_price: 35.5
  }
]

# Create order
iex(5)> Exlivery.create_or_update_order(%{user_cpf: "12312312312", items: items_params})
{:ok, "fba37a43-839e-49fc-b373-1c1d3bc027c4"}

# Generate report
iex(6)> Exlivery.Orders.Report.create()
:ok
```

## :heavy_check_mark: Running the tests

```bash
mix test
.....................

Finished in 0.1 seconds
21 tests, 0 failures

Randomized with seed 136515
```

## :memo: License

This project is under the MIT license. See the [LICENSE](https://github.com/felipe-jm/exlivery/blob/master/LICENSE) for more information.

---

Made with much :heart: and :muscle: by Felipe Jung :blush: <a href="https://www.linkedin.com/in/felipe-jung/">Talk to me!</a>
