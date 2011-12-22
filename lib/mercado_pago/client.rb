module MercadoPago
  class Client
    attr_accessor :id, :secret
    def initialize(options)
      @id = options[:id]
      @secret = options[:secret]
    end

    def access_token
      if access_token_expired?
        response = API.post("/oauth/token", {
          :query => {
            :grant_type => :client_credentials,
            :client_id => id,
            :client_secret => secret
          }
        })

        @access_token_expires_at = Time.now + response["expires_in"]
        @access_token = response["access_token"]
      end

      @access_token
    end

    protected
      def access_token_expired? 
        @access_token_expires_at.nil? || @access_token_expires_at >= Time.now
      end
  end
end
