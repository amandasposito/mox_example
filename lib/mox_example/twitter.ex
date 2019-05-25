defmodule MoxExample.Twitter do
  @callback fetch(String.t()) :: list(map())
end
