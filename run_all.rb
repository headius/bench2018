scripts = Dir['bench*.rb']
opts = [
  "",
  #"-Xcompile.invokedynamic",
  #"-Xcompile.invokedynamic -Xfixnum.cache=false",
]
gcs = [
  "",
  #"-J-XX:+UseG1GC",
  #"-J-XX:+UseParallelGC",
]
jits = [
  "",
  "--jit",
  #"-J-XX:+UnlockExperimentalVMOptions -J-XX:+EnableJVMCI -J-XX:+UseJVMCICompiler",
]
java_homes = [
  "/usr/lib/jvm/java-8-openjdk-amd64",
  #"/home/ubuntu/jdk-10.0.1"
]
rubies = [
#  "jruby-9.1.17.0",
#  "jruby-9.2.0.0",
  "ruby-2.5",
  "ruby-head",
]

rubies.each do |ruby|
  system "rvm install #{ruby}"
  system "rvm #{ruby} do gem install benchmark-ips"
  java_homes.each do |java_home|
    gcs.each do |gc|
      jits.each do |jit|
        scripts.each do |script|
          opts.each do |opts|
            cmd = "JAVA_HOME=#{java_home} rvm #{ruby} do ruby #{gc} #{jit} #{opts} #{script}"
            puts cmd
            system cmd
          end
        end
      end
    end
  end
end
