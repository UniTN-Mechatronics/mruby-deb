#!/usr/bin/env ruby

if __FILE__ == $PROGRAM_NAME
  require 'fileutils'
  unless File.exists?('mruby')
    system 'git clone --depth 1 https://github.com/mruby/mruby.git mruby'
  end
  exit system(%Q[cd mruby; MRUBY_CONFIG=#{File.expand_path __FILE__} ./minirake #{ARGV.join(' ')}])
end

puts "*** USING CUSTOM MRUBY CONFIG #{__FILE__} ***"

MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  # conf.gem File.dirname(__FILE__)
  conf.cc.defines = %w(ENABLE_READLINE)
  conf.gem "mruby/mrbgems/mruby-time"
  conf.gem :github => 'pbosetti/mruby-io', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-dir', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-tempfile', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-pcre-regexp', :branch => 'master' 
  conf.gem :github => 'pbosetti/mruby-yaml', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-merb', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-complex', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-serialport', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-shell', :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-sleep', :branch => 'master'
  conf.gem :github => 'iij/mruby-pack', :branch => 'master'
  conf.gem :github => 'iij/mruby-socket', :branch => 'master'
  conf.gem :github => 'iij/mruby-errno', :branch => 'master'
  conf.gem :github => 'mattn/mruby-thread', :branch => 'master'
  conf.gem :github => 'UniTN-mechatronics/mruby-ftp', :branch => 'master'
  conf.gem :github => 'UniTN-mechatronics/mruby-raspberry', :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-fsm', :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-kalman', :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-mrubot', :branch => 'master'
  conf.gem :github => "UniTN-Mechatronics/mruby-raspicam", :branch => 'master'
  #conf.gem :github => "take-cheeze/mruby-marshal"
  conf.gem :github => 'pbosetti/mruby-emb-require', :branch => 'master'
end
