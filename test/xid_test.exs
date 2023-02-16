defmodule XidTest do
  use ExUnit.Case
  doctest Xid

  test "generate" do
    assert is_binary(Xid.generate())
  end
end
