#!/usr/bin/env ruby

require 'git'
g = Git.open(ENV['PWD'])
g.fetch
