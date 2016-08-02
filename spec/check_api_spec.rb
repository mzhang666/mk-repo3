require 'check_api'

describe TestAPI do
      it "should return when we call the method1" do 
         test = TestAPI.new 
         message = test.method1 
         expect(message).to eq "Accord"
      end

      it "should return when we call the method2" do 
         test = TestAPI.new 
         message = test.method2 
         expect(message).to eq 2016
      end

      it "should return when we call the method3 method" do 
         test = TestAPI.new 
         message = test.method3          
         expect(message).to eq "Accord"
      end
   
end

