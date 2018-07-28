require 'benchmark/ips'

Benchmark.ips do |bm|
  bm.report("bm_bighash") do
    h = {}; 50000.times {|n| h[n] = n }
  end

  bm.report("bm_hash_long") do
    k1 = "Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong";

    k2 = "Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping Pong Ping";

    h = {k1 => 0, k2 => 0};

    30000.times{|i| k = i % 2 ? k2 : k1; h [k] = h[k] + 1}
  end

  bm.report("bm_hash_small2") do
    10000.times.map{|i| a={}; 2.times{|j| a[j]=j}; a}
  end

  bm.report("bm_hash_small4") do
    10000.times.map{|i| a={}; 4.times{|j| a[j]=j}; a}
  end

  bm.report("bm_hash_small8") do
    10000.times.map{|i| a={}; 8.times{|j| a[j]=j}; a}
  end
end
