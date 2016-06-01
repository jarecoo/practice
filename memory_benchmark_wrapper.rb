require 'json'
require 'benchmark'


def measure(&block)

  no_gc = (ARGV[0] == "--no-gc")

  if no_gc
    GC.disable
  else
    GC.start
  end

  grab_memory = 'ps -o rss= -p #{Process.pid}'.to_i/1024

  memory_before = grab_memory
  gc_stat_before = GC.stat
  time = Benchmark.realtime do
    yield
  end

  puts ObjectSpace.count_objects
  unless no_gc
    GC.start(full_mark: true, immediate_sweep: true, immediate_mark: false)
  end
  puts ObjectSpace.count_objects
  gc_stat_after = GC.stat
  memory_after = grab_memory

  puts({
    RUBY_VERSION => {
      gc: no_gc? ? 'disabled' : 'enabled',
      time: time.round(2),
      gc_count: gc_stat_after[:count] - gc_stat_before[:count],
      memory: "%d MB" % (memory_after - memory_before)
    }
  }.to_json)

end