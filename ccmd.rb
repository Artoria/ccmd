require 'thor'
$: << File.dirname(File.expand_path($0))

class CCMDExt < Thor
end

class CCMD < CCMDExt
  def method_missing(sym, *args)
     load "lib/"+sym.to_s+".rb"
     send sym, *args
  end
end

system "git pull"

CCMD.start ARGV