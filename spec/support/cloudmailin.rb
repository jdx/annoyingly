RSpec.configure do |config|
  config.before(:each) do
    EmailsController.any_instance.stub(:verify_signature)
  end
end
