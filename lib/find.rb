class CCMDExt
  desc "find FILE", "download file"
  method_options :base => :string, :level => :number, :linenumber => :boolean
  def find(path)
    l = (options[:level] || 3).to_i
    b = options[:base] || "."
    ln = options[:linenumber]
    ln = ln == false ? false : true
    r = l.times.map{|i| b.tr("\\", "/") + "/*" * i + "/" + path }
    ret = []
    r.each{|a|
       ret.concat Dir.glob(a).to_a
    }
    ret.each_with_index{|x, i|
      puts (ln ? "%3d" % (i+1) : "").fg([1.0,0,0,1.0]) << (" %s" % x)
    }
  end
end