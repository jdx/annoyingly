require 'spec_helper'

describe EmailsController do
  describe "#post" do
    it 'creates a ticket' do
      Message.any_instance.should_receive(:save!)
      post :create, message: {
        from: 'jeff@dickey.xxx',
        subject: 'I need help!',
        html: 'html body',
        plain: 'body'
      }
    end
  end
end
