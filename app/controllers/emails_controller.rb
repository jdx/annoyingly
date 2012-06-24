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
    signature = Digest::MD5.hexdigest(flatten_params(request.request_parameters).sort.map{|k,v| v}.join + ENV['CLOUDMAILIN_SECRET'])

    if provided != signature
      render :text => "Message signature fail #{provided} != #{signature}", :status => 403, :content_type => Mime::TEXT.to_s
      return false
    end
  end

  def flatten_params(params, title = nil, result = {})
    params.each do |key, value|
      if value.kind_of?(Hash)
        key_name = title ? "#{title}[#{key}]" : key
        flatten_params(value, key_name, result)
      else
        key_name = title ? "#{title}[#{key}]" : key
        result[key_name] = value
      end
    end

    return result
  end
end
