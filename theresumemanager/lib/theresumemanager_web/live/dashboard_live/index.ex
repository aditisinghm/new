defmodule TheresumemanagerWeb.DashboardLive.Index do
  use TheresumemanagerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :message, "Dashboard Coming soon!")}
  end
end
