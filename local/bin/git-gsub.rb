#!/usr/bin/env ruby

require 'shellwords'

from, to, path, = ARGV
target_files = (`git grep -l #{from} #{path}`).each_line.map(&:chomp).join ' '
system %|/usr/bin/env sed -i s/#{Shellwords.escape from}/#{Shellwords.escape to}/g #{target_files}|
