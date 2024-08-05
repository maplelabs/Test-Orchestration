#!/bin/bash

# Default environment (can be overridden by passing argument)
ENV=${1:-dev}

# Load environment-specific configurations
export BASE_URL="http://10.81.1.198:9966/"

echo "Environment set to $ENV"
echo "BASE_URL=$BASE_URL"
