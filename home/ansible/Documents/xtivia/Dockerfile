FROM debian:buster-slim

ENV threshold ${ARG_threshold}
ENV source_s3 ${ARG_source_s3}
ENV dest_s3 ${ARG_dest_s3}
ENV AWS_ID ${ARG_AWS_ID}
ENV AWS_key ${ARG_AWS_key}


RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    awscli 

COPY cpscripts.sh /home

RUN chmod 775 /home/cpscripts.sh \
    && aws configure set aws_access_key_id $AWS_ID \
    && aws configure set aws_secret_access_key $AWS_key \
    && aws configure set default.region us-east-1
    

ENTRYPOINT ["/home/cpscripts.sh ${ARG_threshold} ${ARG_source_s3} ${ARG_dest_s3} "]
CMD ["bash"]
