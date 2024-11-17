defmodule TodoApp.JSONParser do
  @spec parse(String.t()) :: {:ok, map()} | {:error, String.t()}
  def parse(json) do
    case Jason.decode(json) do
      {:ok, data} -> {:ok, data}
      {:error, reason} -> {:error, "Failed to parse JSON: #{inspect(reason)}"}
    end
  end

  @spec encode(map()) :: {:ok, String.t()} | {:error, String.t()}
  def encode(map) do
    case Jason.encode(map) do
      {:ok, json} -> {:ok, json}
      {:error, reason} -> {:error, "Failed to encode to JSON: #{inspect(reason)}"}
    end
  end

  @spec encode!(map()) :: String.t()
  def encode!(map) do
    Jason.encode!(map) # 成功時のみ文字列を直接返し、エラーは例外を発生させる
  end
end
