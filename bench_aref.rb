require 'benchmark/ips'

@a = [1]

def foo(a)
  a[0]
end

Benchmark.ips do |x|
  x.time = 10
  x.warmup = 15
  x.report("Instantiation") {
    a = @a
    i = 0; while i < 1_000_000; foo(a); i += 1; end
  }
end
