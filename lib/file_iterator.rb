require "file_iterator/version"

module FileIterator
  class FileIterator
	def initialize(input = nil, output = ARGV[1])
		@outputfile = output
		if input
		    @inputfile = input
		else
			@inputfile = ARGV[0]
			unless @inputfile
			  puts "usage: #{__FILE__} inputfile [outputfile]"
			  exit 1
		    end
		end
	end

	def iterate
		File.open(@inputfile,'r') do | file|
			begin
				if (@outputfile)
					out = File.open(@outputfile,'w')
				else
					out = $stdout
				end
				file.each_line do | line |
					yield(line, out)
				end
			rescue
				raise
			ensure
				out.close if @outputfile
			end
		end
	end
	def to_a
		File.open(@inputfile,'r') do | file|
			result = []
			begin
				if (@outputfile)
					out = File.open(@outputfile,'w')
				else
					out = $stdout
				end
				file.each_line do | line |
					if block_given?
					  result << yield(line)
					else
					  result << line
					end
				end
			rescue
				raise
			ensure
				out.close if @outputfile
			end
			result
		end		
	end
end

end
