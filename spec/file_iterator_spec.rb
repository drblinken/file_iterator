require 'file_iterator'
describe FileIterator::FileIterator do
	describe "constructor" do
		it "just initializes if no block is given" do
			fi = FileIterator::FileIterator.new('numbers.txt')
		end
		it "iterates if block is given" do
			result = []
			fi = FileIterator::FileIterator.new('spec/numbers.txt') do | line |
				result << line.to_i
			end
			expect(result).to eq [1,2,3,4]
		end
	end

	describe "error handling" do
		it "throws an exception if file is missing" do
			expect{FileIterator::FileIterator.new('not there').to_a}.to raise_error
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
end
