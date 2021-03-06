# frozen_string_literal: true
module GlobalConstant

  class Cookie

    class << self

      def user_cookie_name
        'ost_platform_ca'
      end

      def device_verification_toast_cookie_name
        'ost_platform_dvt'
      end

      def last_used_env_cookie_name
        'ost_platform_luse'
      end
      
      def secure_data_access_cookie_name
        'ost_platform_sda'
      end

      def mainnet_env
        'mainnet'
      end

      def sandbox_env
        'testnet'
      end

      def password_auth_prefix
        'p'
      end

      def mfa_auth_prefix
        'm'
      end

      def mfa_auth_expiry
        1.hour
      end

      def password_auth_expiry
        15.minute
      end

      def device_verification_toast_expiry
        1.hour
      end

      def last_used_env_cookie_expiry
        1.year
      end

      def secure_data_access_cookie_expiry
        15.minutes
      end

      def utm_params_cookie_name
        'ost_up'
      end

    end

  end

end
