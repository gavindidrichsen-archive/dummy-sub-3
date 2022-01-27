#!/usr/bin/env ruby
# require 'pry-byebug'

# output = `git fetch --all --prune 2>&1`
output = `git fetch --all --prune --dry-run 2>&1`
# matches = output.scan(/(?<branch>\w+)\s+(?=->)/)
# matches.each do |branch|
#     puts "puppet code deploy #{branch[0]} --wait"
# end
lines = output.split(/\n/)
lines.each do |line|

    # matches = line.scan(/^\s+(\*\s\[(?<action>[^]]*)\]|(?<difference>[\w.]*))\s+(?<branch>\w+)\s+->/)
    matches = line.match(%r{(?<branch>\w+)\s+(?=->)})
    # binding.pry
    next if matches.nil? 
    # matches =  line.match(/^\s+(\*\s\[(?<action>[^]]*)\]|(?<difference>[\w.]*))\s+(?<branch>\w+)\s+->/)
    # puts matches[:branch]
    puts matches[:branch]
end

