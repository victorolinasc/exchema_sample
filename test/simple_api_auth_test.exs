defmodule SimpleApiAuthTest do
  use ExUnit.Case
  doctest SimpleApiAuth

  test "greets the world" do
    assert SimpleApiAuth.hello() == :world
  end
end
