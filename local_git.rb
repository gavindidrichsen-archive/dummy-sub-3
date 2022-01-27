require 'git'
require 'logger'
require 'pp'

log = Logger.new(STDOUT)
g = Git.open(File.join(__dir__, "tmp", "gavindidrichsen-archive", "dummy-meta"), :log => Logger.new(STDOUT, level: Logger::DEBUG))
log.info("the repo:")
puts g.repo
log.info("the branch:")
puts g.branch

log.info("the config")
puts g.config.pretty_inspect