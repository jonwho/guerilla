require 'aws-sdk-s3'
require 'json'

module S3Helper
  extend self

  REGION = 'us-west-1'.freeze
  BUCKET = 'guerillahack'.freeze

  def upload(uuid, encoded_image)
    client.put_object(bucket: BUCKET, key: uuid, body: encoded_image)
  end

  def download(uuid)
    client.get_object(bucket: BUCKET, key: uuid)
  end

  private_class_method :client

  def client
    @client ||= begin
                  Aws::S3::Client.new(profile: profile_name, region: region)
                end
  end
end
