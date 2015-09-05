#!/usr/bin/ruby


#sudo yum -y groupinstall "Development tools"
#sudo yum -y install libxml2-devel libxslt-devel libffi-devel
#sudo yum -y install git rubygems ruby-devel
#sudo gem install bundler
#gem install aws-sdk -v "~>1"



require 'rubygems'
require 'aws-sdk'


access_key = 'アクセスKey'
secret_key = 'シークレットKey'
sns_endpoint = 'sns.ap-northeast-1.amazonaws.com'
topic_arn = 'SNS ARN'
#
AWS.config(:access_key_id => access_key,
:secret_access_key => secret_key,
:sns_endpoint => sns_endpoint)
#
topic = AWS::SNS::Topic.new(topic_arn)
message = mpstat -P ALL

                 while true
                    topic.publish(message)
                      sleep 60
                 end	
