require 'open3'
class CCMDExt
  no_commands do
    def _pr(file, out)
      t = Thread.new do
          Open3.popen3(file) do |stdin, stdout, stderr|
            index = 1
            until stdout.eof?
              out.call("%6d %s" % [index, stdout.gets])
              index += 1
              sleep(0.01)
            end
          end
      end
      t.abort_on_exception = true
      t
    end
  end
  
  desc "pr FILE", "parallel run file"
  def pr(file)
    x = IO.readlines(file).to_a
    lines = Array.new(x.length, nil)
    t = x.map.with_index{|name, i|
       _pr(name, lambda{|str| lines[i] = str; sleep(0.01) })
    }
    loop do
      sleep(1)
      system "cls"; 
      puts lines.map.with_index{|x, i| "  %3d %s %s" % [i + 1, t[i].alive?.to_s[0], x]} 
      break if t.all?{|x| !x.alive?}
    end
  end

end