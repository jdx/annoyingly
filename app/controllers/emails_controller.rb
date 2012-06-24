class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :authenticate
  before_filter :verify_signature

  def create
    message = Message.new(params[:message])
    message.save!
    render nothing: true, status: 200
  end

  private

  def verify_signature
    provided = request.request_parameters.delete(:signature)
    signature = Digest::MD5.hexdigest(request.request_parameters.sort.map{|k,v| v}.join + ENV['CLOUDMAILIN_SECRET'])

    if provided != signature
      render text: "Message signature fail #{provided} != #{signature}", status: 403
      return false
    end
  end
end
