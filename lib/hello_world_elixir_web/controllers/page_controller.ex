defmodule HelloWorldElixirWeb.PageController do
  use HelloWorldElixirWeb, :controller

  def index(conn, _params) do
    name = System.get_env("NAME") || "World"
    message = "Hello, #{name}!"
    render conn, "index.html", message: message
  end
end
