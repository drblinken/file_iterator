require "file_iterator/version"

module FileIterator
	class FileIterator
		def initialize(input = nil, output = ARGV[1], command_line = nil)
			@command_line = command_line
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
			iterate(&Proc.new) if block_given?
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
						yield(line, out) unless line[0] == '#'
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
						unless line[0] == '#'
							if block_given?
								result << yield(line)
							else
								result << line
							end
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
