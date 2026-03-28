require "bundler/setup"
require "wayback_archiver"
require "logger"

WaybackArchiver.logger = Logger.new($stdout)
WaybackArchiver.concurrency = 1
WaybackArchiver.max_limit = -1

start_url = "https://perthpriorityremovals.com.au"

WaybackArchiver.archive(start_url)
