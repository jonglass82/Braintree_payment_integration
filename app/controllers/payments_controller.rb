
class PaymentsController < ApplicationController
        

def make_payment
    
        @gateway = Braintree::Gateway.new(
        :environment => :sandbox,
        :merchant_id => MERCHANT_ID,
        :public_key => PUBLIC_KEY,
        :private_key => PRIVATE_KEY
        )

        @client_token = @gateway.client_token.generate

        puts @client_token
    
end
   
    
def checkout
    
        @result = @gateway.transaction.sale(
        :amount => "1000.00",
        :payment_method_nonce => nonce_from_the_client,
        :options => {
        :submit_for_settlement => true
        })
    
 
         if result.success?
            puts "success!: #{result.transaction.id}"
        elsif result.transaction
            puts "Error processing transaction:"
            puts "  code: #{result.transaction.processor_response_code}"
            puts "  text: #{result.transaction.processor_response_text}"
        else
            puts result.errors
       
    end
    
end
    

end
    
