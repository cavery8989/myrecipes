require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    
    def setup
       @chef = Chef.new(name:"Chris", email:"chris@hats.com") 
    end
    
    test "chef should  be valid" do
        assert @chef.valid?
        
    end
    
    test "name must be present" do
       @chef.name = ""
       assert_not @chef.valid? 
    end
    
    test "Name should be more than 3 characters" do
        
        @chef.name = "aa"
        assert_not @chef.valid?
    
    end
    
    test "Name should be less than 40 characters" do
       @chef.name ="a" * 41
       assert_not @chef.valid?
    end
    
    test "Email address should be present" do
       @chef.email = ""
        assert_not @chef.valid? 
    end
    
    
    test "Email address should be within bounds" do
       @chef.email = "a" * 101 + "@example.com"
        assert_not @chef.valid? 
    end
    
    test "Email should be unique" do
        dup_chef = @chef.dup
        dup_chef.email = @chef.email.upcase
        @chef.save
        assert_not dup_chef.valid?
    end
    
    test "Email validation should accept valid addresses" do
        
        valid_addresses = %w[hasd@asdsd.com TJD-HS@asdasd.org.uk fitst.last@pie.au]
        
        valid_addresses.each do |va|
            @chef.email = va 
            assert @chef.valid?, "#{va.inspect} should be valid"
            
        end
    
    end
    
    test "Email validation reject invalid addresses" do
        
        invalid_addresses = %w[user@example com user_asas_adasd.org sdasdasd@12__3123123.com]
        
        invalid_addresses.each do |iv| 
            @chef.email = iv
            assert_not @chef.valid?, "#{iv.inspect} should not be valid"
        end
            
    
    end
  
end
