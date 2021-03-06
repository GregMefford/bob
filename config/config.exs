use Mix.Config

config :bob,
  schedule: [
    [
      module: Bob.Job.BackupS3,
      args: [],
      period: :day,
      time: {1, 0, 0}
    ],
    [
      module: Bob.Job.BackupDB,
      args: [],
      period: :day,
      time: {0, 15, 0}
    ],
    [
      module: Bob.Job.BuildOTPChecker,
      args: [],
      period: {15, :min}
    ]
  ]

config :bob,
  github_secret: System.get_env("BOB_GITHUB_SECRET"),
  github_user: System.get_env("BOB_GITHUB_USER"),
  github_token: System.get_env("BOB_GITHUB_TOKEN")

config :porcelain, driver: Porcelain.Driver.Basic

config :ex_aws,
  access_key_id: {:system, "BOB_S3_ACCESS_KEY"},
  secret_access_key: {:system, "BOB_S3_SECRET_KEY"}

config :logger, :console,
  format: "$time $metadata[$level] $message\n"

config :rollbax, enabled: false

import_config "#{Mix.env()}.exs"
