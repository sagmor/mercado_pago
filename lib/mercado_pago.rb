require "hashie"
require "multi_json"
require "httparty"

require "mercado_pago/version"
require "mercado_pago/api"
require "mercado_pago/client"
require "mercado_pago/preference"
require "mercado_pago/item"
require "mercado_pago/notification"

module MercadoPago
  autoload :Old, "mercado_pago/old"
end
