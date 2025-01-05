class FooJob < ApplicationJob
  queue_as :bar_queue

  def perform(*args)
    # Do something later
    sleep(args[0])
    logger.info("slept #{args[0]} seconds job!")
    return true
  end
end
