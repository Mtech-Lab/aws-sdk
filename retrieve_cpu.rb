#!/usr/bin/ruby


#Added by Mtech-Lab Sep 5th 2015
#Current aws-sdk is v2, need to run following commands to install necessary tools
#If v2 is already installed, make sure to require "aws-sdk-v1".

#sudo yum -y groupinstall "Development tools"
#sudo yum -y install libxml2-devel libxslt-devel libffi-devel
#sudo yum -y install git rubygems ruby-devel
#sudo gem install bundler
#gem install aws-sdk -v "~>1"


require 'rubygems'
require 'aws-sdk'

access_key = ‘アクセスID’
secret_key = ‘シークレットID’
sss_endpoint = ‘SQSのARN’
queue_url = ‘SQSのURL’
queue_name = ‘Queueの名前’

sqs = AWS::SQS.new(:access_key_id => access_key,
:secret_access_key => secret_key,
:sss_endpoint => sss_endpoint,
:queue_url => queue_url ).client

while true
message = sqs.receive_message(:queue_url => queue_url)[:messages][0]
if message
puts message[:body]
sqs.delete_message(:queue_url => queue_url, :receipt_handle => message[:receipt_handle])
puts "Waiting"
end
sleep 5
end
