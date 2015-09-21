require 'net/http'
class CCMDExt
  desc "dl URL PATH", "download file"
  def dl(url, path)
    open(path, 'wb') do |f|
      f.write Net::HTTP.get URI(url)
    end
  end
end