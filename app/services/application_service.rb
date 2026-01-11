# frozen_string_literal: true

class ApplicationService
  # Result structure for service responses
  # @attr [Boolean] success? - whether the operation succeeded
  # @attr [Object] value - the result value on success
  # @attr [Object] error - the error on failure
  Result = Struct.new(:success?, :value, :error, keyword_init: true) do
    def self.success(value = nil)
      new(success?: true, value: value, error: nil)
    end

    def self.failure(error)
      new(success?: false, value: nil, error: error)
    end

    def failure?
      !success?
    end
  end

  class << self
    # Main entry point for service execution
    # @return [Result] the result of the service call
    def call(...)
      new(...).call
    end
  end

  # Override in subclasses to implement the service logic
  # @return [Result] the result of the service call
  def call
    raise NotImplementedError, "#{self.class}#call must be implemented"
  end

  private

  # Render a prompt template from app/views/prompts/
  #
  # @param template [String] the template path relative to app/views/prompts/
  # @param locals [Hash] the local variables to pass to the template
  # @return [String] the rendered prompt
  #
  # @example
  #   render_prompt("analyses/summarizer", data: @analysis_data)
  #   # Renders app/views/prompts/analyses/summarizer.text.erb
  def render_prompt(template, **locals)
    ApplicationController.render(
      template: "prompts/#{template}",
      locals: locals
    )
  end
end
