# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-slim


# Install necessary packages
RUN apt-get update && \
    apt-get install -y git wget maven  && \
    apt-get clean


EXPOSE 8080
# Create a directory for the tests
#RUN mkdir target

# Copy the entrypoint script into the container
#git clone https://github.com/Ankit-Tripathi-ML/KarateAutomation.git

COPY entrypoint.sh /entrypoint.sh
COPY EnvConfig.sh /EnvConfig.sh
#RUN  chmod 777 karate.jar
# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]