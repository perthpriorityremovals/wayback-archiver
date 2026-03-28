require "bundler/setup"
require "wayback_archiver"
require "logger"

logger = Logger.new($stdout)
logger.level = Logger::DEBUG

WaybackArchiver.logger = logger
WaybackArchiver.concurrency = 1
WaybackArchiver.max_limit = -1

start_url = "https://perthpriorityremovals.com.au"

puts "Starting archive run for: #{start_url}"

result = WaybackArchiver.archive(start_url)

puts "Archive run finished."
puts "Result: #{result.inspect}"
