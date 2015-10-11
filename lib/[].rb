class CCMDExt
  desc "[] line", "fetch lines"
  def [](line)
    puts STDIN.readlines.to_a[line.to_i]
  end

end