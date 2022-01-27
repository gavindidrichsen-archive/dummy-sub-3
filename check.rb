#!/usr/bin/env ruby

output = `git fetch --all --prune --dry-run 2>&1`
lines = output.split(/\n/)
lines.each do |line|
    matches =  line.match(%r{^\s+(\*\s\[(?<action>[^\]]*)\]|(?<difference>[\w.]*))\s+(?<branch>\w+)\s+->})
    next if matches.nil? 
    puts "#{matches[:branch]} [#{matches[:action]}#{matches[:difference]}]"
end

