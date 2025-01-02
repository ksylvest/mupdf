# frozen_string_literal: true

module MuPDF
  # An error raised when an mutool command errors.
  class CommandError < StandardError
    # @param cmd [String]
    # @param result [String]
    # @param status [Process::Status]
    def initialize(cmd:, result:, status:)
      super("cmd=#{cmd.inspect} result=#{result.inspect} status=#{status.inspect}")
      @cmd = cmd
      @result = result
      @status = status
    end
  end
end
