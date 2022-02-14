#!/usr/bin/env ruby
=begin
Sample output is below

```
Given the git fetch --all --prune output of:

```
➜  dummy-sub-3-AAA git:(master) git fetch --all --prune
Fetching origin
From https://github.com/gavindidrichsen-archive/dummy-sub-3
 - [deleted]         (none)     -> origin/feature_aaa_2
   59a1e46..c664903  master        -> origin/master
 * [new branch]      feature_aaa   -> origin/feature_aaa
 * [new branch]      feature_bbb_1 -> origin/feature_bbb_1
```

The following output will be parsed (the deleted one is not yet):

```
➜  dummy-sub-3-AAA git:(master) ✗ ./check.rb
master [59a1e46..c664903]
feature_aaa [new branch]
feature_bbb_1 [new branch]
```
=end
def puppet_code_deploy_all(matches)
    puts "#{matches[:branch]} [#{matches[:action]}#{matches[:difference]}]"
end
output = `git fetch --all --prune --dry-run 2>&1`
lines = output.split(/\n/)
lines.each do |line|
    matches =  line.match(%r{^\s+(\*\s\[(?<action>[^\]]*)\]|(?<difference>[\w.]*))\s+(?<branch>\w+)\s+->})
    next if matches.nil? 
    puppet_code_deploy_all(matches)
end

