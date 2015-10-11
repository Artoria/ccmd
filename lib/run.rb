class CCMDExt
  desc "exec!", "exec stdin"
  def exec!
    system "#{STDIN.read.strip.tr('/', '\\')} < con > con"
  end

end