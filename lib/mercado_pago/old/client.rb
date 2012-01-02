module MercadoPago
  module Old
    class Client
      attr_accessor :id, :token, :sonda

      def initialize(options)
        @id    = options[:id]
        @token = options[:token]
        @sonda = options[:sonda]
      end

      def preference(attributes)
        preference = Preference.new(attributes)
        preference.client = self
        preference
      end

      def notification(params)
        Notificaton.new(params)
      end
    end
  end
end
