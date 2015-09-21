require 'thor'
require 'tco'
$: << File.dirname(File.expand_path($0))
class CCMDExt < Thor
end

system "git pull -q"

Dir.glob("lib/*.rb").each &method(:require)


class CCMD < CCMDExt
  def method_missing(sym, *args)
     send sym, *args
  end
end


CCMD.start ARGV