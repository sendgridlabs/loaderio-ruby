module Loaderio
  class Result
    attr_accessor :avg_error_rate, :avg_response_time, :data_received, :data_sent,
                  :error, :network_error, :public_results_url, :result_id, :started_at,
                  :status, :success, :timeout_error
    def initialize(attributes)
      @result_id          = attributes[:result_id]
      @avg_error_rate     = attributes[:avg_error_rate]
      @avg_response_time  = attributes[:avg_response_time]
      @data_received      = attributes[:data_received]
      @data_sent          = attributes[:data_sent]
      @error              = attributes[:error]
      @network_error      = attributes[:network_error]
      @public_results_url = attributes[:public_results_url]
      @started_at         = attributes[:started_at]
      @status             = attributes[:status]
      @domain             = attributes[:domain]
      @success            = attributes[:success]
      @timeout_error      = attributes[:timeout_error]
    end

    def self.resource_name
      "results"
    end
  end
end