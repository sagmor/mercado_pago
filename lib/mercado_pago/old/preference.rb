module MercadoPago
  module Old
    # For info about the parameters Check:
    #   https://www.mercadopago.com/mla/ml.faqs.framework.main.FaqsController?pageId=FAQ&faqId=9381&categId=adv&type=FAQ
    class Preference < Hashie::Mash

      def url
        if self[:url].nil?
          uri = URI.parse "https://www.mercadopago.com/mla/orderpreference"
          response = Net::HTTP.post_form(uri, self)
          self[:url] = response
        end

        self[:url]
      end
    end
  end
end
