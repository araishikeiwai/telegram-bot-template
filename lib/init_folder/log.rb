class Object.const_get($namespace_class)::Log
  include SuckerPunch::Job
  workers 5

  def perform(message)
    $logger.info do
      message.gsub("\n", ' ::: ')
    end
  end
end
