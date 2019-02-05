class DeveloperController < WebController

  before_action :verify_super_admin_role , :except => [:developer_get]
  before_action :verify_is_xhr , :except => [:developer_get]

  # Get developer's page data
  #
  # * Author: Ankit
  # * Date: 04/02/2019
  # * Reviewed By:
  #
  def developer_get
    service_response = DeveloperManagement::FetchDetails.new(params).perform
    render_api_response(service_response)
  end

  # Get developer's api key and secret key
  #
  # * Author: Ankit
  # * Date: 04/02/2019
  # * Reviewed By:
  #
  def api_keys_get
    service_response = ClientManagement::ApiCredentials::Fetch.new(params).perform
    render_api_response(service_response)
  end

  # Generate new api keys
  #
  # * Author: Ankit
  # * Date: 04/02/2019
  # * Reviewed By:
  #
  def api_keys_post
    service_response = ClientManagement::ApiCredentials::Rotate.new(params).perform
    render_api_response(service_response)
  end

  # Deactivate key
  #
  # * Author: Ankit
  # * Date: 04/02/2019
  # * Reviewed By:
  #
  def api_keys_delete
    service_response = ClientManagement::ApiCredentials::Deactivate.new(params).perform
    render_api_response(service_response)
  end

end