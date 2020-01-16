class LoggerUtility

  def self.log_info(message)
    Rails.logger.info { "#{message}" }
  end

  def self.log_debug(message)
    Rails.logger.debug { "#{message}".cyan }
  end

  def self.log_error(message)
    Rails.logger.error { "#{message}".magenta }
  end

  def self.log_starting_request(current_request_name, data_being_sent="")
    overall_message = "Request Starting - #{current_request_name}"
    if data_being_sent != ""
      overall_message += "\n#{data_being_sent}"
    end
    Rails.logger.info { overall_message }
  end

  def self.log_successful_request(current_request_name, json_body="")
    overall_message = "Request Successful - #{current_request_name}".light_green
    if json_body != ""
      overall_message += "\n#{json_body}"
    end
    Rails.logger.info { overall_message }
  end

  def self.log_failed_request(current_request_name, http_request_body="")
    overall_message = "Request Failed - Attempted #{current_request_name} retrieval".red
    if http_request_body != ""
      overall_message += "\n#{http_request_body}"
    end
    Rails.logger.error { overall_message }
  end

  def self.log_special_note(message)
    Rails.logger.info { "#{message}".yellow }
  end

end
