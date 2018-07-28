require 'benchmark/ips'

def normal(a, b)
  a > b ? b : a
end

def weird(a, b)
  [a,b].sort.at(0)
end

Benchmark.ips do |bm|
  bm.report("normal") {|n| i = 0; j = 0; while i < n; i+=1; j = normal(i, j); j = i; end }
  bm.report("weird") {|n| i = 0; j = 0; while i < n; i+=1; j = weird(i, j); j = i; end }
end
