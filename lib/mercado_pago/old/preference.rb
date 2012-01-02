module MercadoPago
  module Old
    # For info about the parameters Check:
    #   https://www.mercadopago.com/mla/ml.faqs.framework.main.FaqsController?pageId=FAQ&faqId=9381&categId=adv&type=FAQ
    class Preference < Hashie::Mash
      attr_accessor :client

      def url
        if @url.nil?
          response = RestClient.post(
            "https://www.mercadopago.com/mla/orderpreference",
            self.to_hash.merge({
              :acc_id => client.id,
              :token => client.token
            }))

          @url = response.strip
        end

        @url
      end
    end
  end
end
