module BlueConductor
  module HTTP
    module Response
      class Responder

        def self.parse(html, klass)
          doc = convert_to_nokogiri(html)

          responder = klass.new(doc)
          responder.parse
        end

        private 

        def self.convert_to_nokogiri(html)
          Nokogiri::HTML(html)
        end
      end
    end
  end
end
