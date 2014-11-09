require "file_iterator/version"

module FileIterator
	class FileIterator
		def initialize(input: nil, output: ARGV[1], comment_symbol: nil)
			@comment_symbol = comment_symbol
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

		def is_comment_line(line)
			(@comment_symbol != nil) && line[0] == @comment_symbol
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
						yield(line, out) unless is_comment_line(line)
					end
				rescue
					raise
				ensure
					out.close if @outputfile
				end
			end
		end
		
		def to_a
			result = []
			iterate do | line |
				if block_given?
					result << yield(line)
				else
					result << line
				end
			end
			result
		end

	end
end
