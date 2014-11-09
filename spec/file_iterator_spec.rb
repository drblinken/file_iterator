require 'file_iterator'
describe FileIterator::FileIterator do
	describe "collections" do
		it "just initializes if no block is given" do
			fi = FileIterator::FileIterator.new(input: 'numbers.txt')
		end
		it "iterates if block is given" do
			result = []
			FileIterator::FileIterator.new(input: 'spec/numbers.txt') do | line |
				result << line.to_i
			end
			expect(result).to eq [1,2,3,4]
		end
		it "iterates" do
			result = []
			fi = FileIterator::FileIterator.new(input: 'spec/numbers.txt') 
			fi.iterate do | line |
				result << line.to_i
			end
			expect(result).to eq [1,2,3,4]
		end
		it "converts to array" do
			result = FileIterator::FileIterator.new(input: 'spec/numbers.txt').to_a.map(&:to_i)
			expect(result).to eq [1,2,3,4]
		end
	end

	describe "error handling" do
		it "throws an exception if file is missing" do
			expect{FileIterator::FileIterator.new(input: 'not there').to_a}.to raise_error
		end
		it "throws an exception if used with block" do
			expect do
				a = []
				FileIterator::FileIterator.new('not there') do | line |
					a << line
				end
			end.to raise_error
		end
	end
	describe "comments" do
		it "ignores lines with comments" do
			expect(FileIterator::FileIterator.new(input: 'spec/file_with_comment.txt', comment_symbol: '#').to_a(&:to_i)).to eq [1, 2, 3, 4]
		end
	end
end
