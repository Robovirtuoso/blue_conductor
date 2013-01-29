module BlueConductor
  module URL
    module Sanitizer
      UNWANTED_CHARS = %r([^a-zA-Z0-9])

      def sanitize(str)
        str.downcase.gsub(UNWANTED_CHARS, "-")
      end
    end
  end
end
