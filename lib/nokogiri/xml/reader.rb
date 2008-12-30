module Nokogiri
  module XML
    class Reader
      include Enumerable

      def each(&block)
        while node = self.read
          block.call(node)
        end
      end
      private :initialize

      def attributes
        Hash[*(attribute_nodes.map { |node|
          [node.name, node.to_s]
        }.flatten)].merge(namespaces || {})
      end
    end
  end
end
