class Token::SetupController < WebController

  # Get token details
  #
  # * Author: Ankit
  # * Date: 19/12/2018
  # * Reviewed By:
  #
  def token_details_get
    service_response = TokenManagement::GetTokenDetails.new(params).perform
    render_api_response(service_response)
  end

  # Set token details
  #
  # * Author: Ankit
  # * Date: 19/12/2018
  # * Reviewed By:
  #
  def token_details_post
    service_response = TokenManagement::InsertTokenDetails.new(params).perform
    render_api_response(service_response)
  end

  # Start token deployment
  #
  # * Author: Ankit
  # * Date: 19/12/2018
  # * Reviewed By:
  #
  def deploy
    service_response = TokenManagement::Deploy.new(params).perform
    render_api_response(service_response)
  end

end
