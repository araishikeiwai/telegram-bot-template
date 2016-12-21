class Object.const_get($namespace_class)::InputProcessor
  include SuckerPunch::Job
  workers 5

  def perform(message, bot)
    @bot = bot

    # uncomment to ignore edited messages
    # return if message.edit_date

    # uncomment to ignore other type of messages
    # return unless message.text

    # uncomment to log incoming messages
    # $namespace_class.constantize.log("INCOMING #{message.inspect}")

    text = message.text.sub("@#{$bot_username}", '')

    if message.from.id == $admin_id && text =~ /reload/i
      Rake::Task["#{$namespace}:reload"].execute
      return
    end

    # ADD YOUR BOT LOGIC HERE
  end

  private

  # ADD AUXILIARY METHODS HERE

  def reply(message, text)
    send(chat_id: message.chat.id, text: text, reply_to_message_id: message.message_id)
  end

  def send(options = {})
    $namespace_class.constantize::MessageSender.perform_async(@bot, options)
  end
end
