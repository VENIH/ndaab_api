#!/bin/bash

# Set. your AS region
AWS_REGION="us-east-1"

# Replace with your desired A¥S region

# Set. the log oraup nane for Hains access logs
ACCESS_L0G_GROUP="NginxAccessLogs" # Replace with your desired 10g group nose

# Set. the log oroup nase for Hat error logs
ERROR_L0G_GROUP="NginxErrorLogs" #Replace with your desired 10g group none

#create log groups for access and error logs

aws logs create-log-group --log-group-name "$ACCESS_LOG_GROUP" --region "$AWS_REGION"
aws logs create-log-group --log-group-name "$ERROR_LOG_GROUP" --region "$AWS_REGION"

if [ $? -eq 0 ]; then
    echo "Logs groups created successfully."

    #create logs stream for access and error logs (you can adjust this based on your requirements)

    aws logs create-log-stream --log-group-name "$ACCESS_LOG_GROUP" --log-stream-name "$(date +%Y-%m-%d)-access" --region "$AWS_REGION"
    aws logs create-log-stream --log-group-name "$ERROR_LOG_GROUP" --log-stream-name "$(date +%Y-%m-%d)-access" --region "$AWS_REGION"
    
    #verify that the logs stream were created
    if [ $? -eq 0 ]; then 
        echo "Log stream created successfully."
    else
        echo "Error: Log stream creation failed."
    fi