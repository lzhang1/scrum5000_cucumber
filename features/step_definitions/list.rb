require 'json'
require 'rest-client'
When /^I send the "(.*?)" url as (POST|GET|PUT|DELETE) request(?: with the ["'](.*?)['"] args)?$/ do |url, method, _args|
	if _args
    args = JSON.parse(_args)
  else
    args = {}
  end
	if args
  	def args.closed?()
    	return true
    end
    def args.read(xargs)
      return JSON.dump(self)
    end
  end
	login="lzhang@redhat.com"
	password="rayzhang13"
  req = RestClient::Request.new(:url => "http://127.0.0.1:3000/#{url}",
                               :user => "#{login}",
                               :password => "#{password}",
                               :method => method,
                               :headers => {
                                   'Content-Type' => 'application/json',
                                   })
	binding.pry
	res = req.execute()
	binding.pry
	@result = {
    :instruction => "#{method} #{url} #{JSON.dump(args)}",
    :response   => res,
    :result     => true,
    :exitstatus => 0
  }
end
