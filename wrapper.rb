require 'json'
require 'benchmark'


def measure(&block)

  no_gc = (ARGV[0])

  if no_gc
    GC.disable
  else
    GC.start
  end

end
