module LibParser
  class File
    def initialize(file:, separator:)
      check_params!(file: file, separator: separator)
    end

    private

    ##
    #
    # Check if any param is missing (nil or an empty string)
    # If any param is missing, raise an exception
    #
    def check_params!(params)
      params.each do |key, param|
        raise ArgumentError.new("missing keyword: #{key}") if param.nil? || param.empty?
      end
    end
  end
end
