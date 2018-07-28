require 'benchmark/ips'

TIMES = 3 * 1_000_000

require 'date'

Benchmark.ips do |x|
  x.iterations = 3
  x.time = 10
  x.warmup = 10

  x.report("Date._strptime('2001-02-03', '%Y-%m-%d') [#{TIMES}x]") do
    Date._strptime('2001-02-03', '%Y-%m-%d')
  end
  x.report("Date._strptime('2017-05-20 18:20:10', '%Y-%m-%d %H:%M:%S') [#{TIMES}x]") do
    Date._strptime '2017-05-20 18:20:10', '%Y-%m-%d %H:%M:%S'
  end

  x.report("Date.parse('2018-07-17', false) [#{TIMES}x]") do
    Date.parse '2018-07-17'
  end

  x.report("Date._parse('2018-07-17 21:20:55') [#{TIMES}x]") do
    Date._parse '2018-07-17 21:20:55'
  end

  x.report("Date.iso8601('1999-12-31T00:00:00') [#{TIMES}x]") do
    Date.iso8601 '1999-12-31T00:00:00'
  end

  x.report("DateTime.iso8601('1999-12-31T19:20:06') [#{TIMES}x]") do
    Date.iso8601 '1999-12-31T19:20:06'
  end

end
