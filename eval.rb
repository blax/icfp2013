require 'treetop'

base_path = File.expand_path(File.dirname(__FILE__))

require File.join(base_path, 'node_extensions.rb')

class Parser
	Treetop.load(File.expand_path(File.join(File.dirname(__FILE__), 'bv_parser.treetop')))
	@@parser = BVParser.new

	def self.parse(data)
		tree = @@parser.parse(data)

		if(tree.nil?)
			raise Exception, "Parse error at: #{@@parser.index}"
		end

		return tree
	end

end