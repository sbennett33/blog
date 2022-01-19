import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pattern_matching, PatternMatchingWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VL0xrM0GQnY8FlFMJY+uVj4B8o1SwZD5ieuNwLVq+EwqS5pYF8YaTBZMjFaJhCtN",
  server: false

# In test we don't send emails.
config :pattern_matching, PatternMatching.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
