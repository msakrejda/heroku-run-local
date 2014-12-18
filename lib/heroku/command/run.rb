require "heroku/command/base"

# run one-off commands (console, rake)
#
class Heroku::Command::Run < Heroku::Command::Base
  # run:local COMMAND
  #
  # run a command locally with the config vars of a heroku
  #   app in your environment. Note: if your command
  #   directly includes environment variable references;
  #   you must quote these or they will be interpreted
  #   by your shell before being passed to `heroku run:local`.
  #
  #Example:
  #
  # $ heroku run:local psql '$DATABASE_URL'
  # Pager usage (pager) is off.
  #   psql (9.4beta2, server 9.3.5)
  # SSL connection (protocol: TLSv1.2, cipher: DHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
  # Type "help" for help.
  #
  # d6i28tbalesa80=>
  #
  def local
    command = args.join(" ")
    error("Usage: heroku run COMMAND") if command.empty?

    vars = api.get_config_vars(app).body
    vars.reject { |key,_| %w(PATH LD_LIBRARY_PATH).include? key }.each do |key, value|
      ENV[key] = value
    end

    exec(command)
  end
end
