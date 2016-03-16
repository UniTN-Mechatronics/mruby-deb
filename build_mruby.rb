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
  MRBGEMS_ROOT = "/usr/local/mrblib"
  toolchain :gcc
  enable_debug
  conf.gembox 'default'
  conf.cc.defines += %w(ENABLE_READLINE)
  conf.gem "mruby/mrbgems/mruby-time"
  conf.gem 'mruby/mrbgems/mruby-hash-ext'
  conf.gem 'mruby/mrbgems/mruby-eval'
  conf.gem 'mruby/mrbgems/mruby-exit' # for exiting from within a script
  conf.gem 'mruby/mrbgems/mruby-string-ext'

  conf.gem :github => 'pbosetti/mruby-io',                  :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-dir',                 :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-tempfile',            :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-pcre-regexp',         :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-yaml',                :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-merb',                :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-complex',             :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-serialport',          :branch => 'master'
  conf.gem :github => 'pbosetti/mruby-shell',               :branch => 'master'
  conf.gem :github => 'iij/mruby-pack',                     :branch => 'master'
  conf.gem :github => 'iij/mruby-socket',                   :branch => 'master'
  conf.gem :github => 'iij/mruby-errno',                    :branch => 'master'
  conf.gem :github => 'iij/mruby-process',                  :branch => 'master'
  conf.gem :github => 'ksss/mruby-signal',                  :branch => 'master'
  conf.gem :github => 'UniTN-mechatronics/mruby-ftp',       :branch => 'master'
  conf.gem :github => 'UniTN-mechatronics/mruby-raspberry', :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-fsm',       :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-kalman',    :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-mrubot',    :branch => 'master'
  conf.gem :github => 'UniTN-Mechatronics/mruby-gsl'    , :branch => 'master'
  #
  # # The following is HIGHLY EXPERIMENTAL
  # # before building, cd to mruby/build/mrbgems/mruby-raspicam/lib and do
  # # make and sudo make install.
  # conf.gem :github => 'UniTN-Mechatronics/mruby-raspicam', :branch => 'master'
  #
  # # Gems added AFTER this mruby-require will be compiled as .so files
  # # and can be required at runtime. The interpreter will search for them
  # # under /usr/lib/mruby
  conf.gem :github => 'pbosetti/mruby-emb-require', :branch => "master"
  if g = conf.gems.find {|e| e.name.match /mruby-require/} then
    g.build.cc.flags << "-DMRBGEMS_ROOT=\\\"#{MRBGEMS_ROOT}\\\""
    g.build.linker.flags << "-ldl"
  end
  
end
