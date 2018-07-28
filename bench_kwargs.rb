def foo(a:1)
  a
end

(ARGV[0] || 20).to_i.times {
  t = Time.now 
  i = 0
  while i < 10_000_000
    i+=foo(a: 1)
  end
  puts Time.now - t
}
