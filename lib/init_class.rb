eval <<DYNAMIC
  class #{$namespace_class}

    def self.start
      Telegram::Bot::Client.run('#{$telegram_bot_token}') do |bot|
        bot.listen do |message|
          #{$namespace_class}::InputProcessor.perform_async(message, bot)
        end
      end
    rescue StandardError => e
      log(e.inspect)
      retry
    end

    def self.log(message)
      #{$namespace_class}::Log.perform_async(message)
    end

    def self.reload!
      Rake::Task['#{$namespace}:reload'].execute
    end
  end
DYNAMIC
