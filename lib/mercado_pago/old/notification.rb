module MercadoPago
  module Old
    class Notification < Hashie::Mash
      def approved?
        status == "A"
      end
    end
  end
end
