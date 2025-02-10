iex> pattern = ~r/[a-z]+/
~r/[a-z]+/
iex> "hello world" =~ pattern
{:match, "hello"}
iex> "123456" =~ pattern
:nomatch
