module CacheManagement

  class TokenAddresses < CacheManagement::Base

    # Fetch from db
    #
    # * Author: Dhananjay
    # * Date: 20/12/2018
    # * Reviewed By:
    #
    # @return [Result::Base]
    #
    def fetch_from_db(token_ids)
      rsp = ::TokenAddresses.new.fetch_all_addresses({token_ids:token_ids})
      data_to_cache = rsp.data
      success_with_data(data_to_cache)
    end

    #
    # * Author: Dhananjay
    # * Date: 20/12/2018
    # * Reviewed By:
    #
    # @return [MemcacheKey]
    #
    def memcache_key_object
      @m_k_o ||= MemcacheKey.new('token_address.details')
    end

    # Fetch cache key
    #
    # * Author: Dhananjay
    # * Date: 20/12/2018
    # * Reviewed By:
    #
    # @return [String]
    #
    def get_cache_key(token_id)
      memcache_key_object.key_template % @options.merge(token_id: token_id)
    end

    # Fetch cache expiry (in seconds)
    #
    # * Author: Dhananjay
    # * Date: 20/12/2018
    # * Reviewed By:
    #
    # @return [Integer]
    #
    def get_cache_expiry
      memcache_key_object.expiry
    end

  end
end