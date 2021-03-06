defmodule Coney.Consumer do
  @type stacktrace :: []
  @callback connection() :: map()
  @callback parse(message :: binary(), meta :: map()) :: any
  @callback process(payload :: any, meta :: map()) ::
              :ok | :reject | :redeliver | {:reply, binary()}
  @callback error_happened(exception :: struct(), message :: binary(), meta :: map()) ::
              :ok | :reject | :redeliver | {:reply, binary()}
  @callback error_happened(
              exception :: struct(),
              stacktrace :: stacktrace(),
              message :: binary(),
              meta :: map()
            ) ::
              :ok | :reject | :redeliver | {:reply, binary()}

  @optional_callbacks connection: 0, error_happened: 3, error_happened: 4
end
