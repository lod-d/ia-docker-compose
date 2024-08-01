# Use the appropriate base image
FROM ollama/ollama

# Set the working directory
WORKDIR /bin/ollama

# Expose the necessary port
EXPOSE 11434

# Start the ollama service and pull the model
RUN ollama pull qwen2:0.5b

# Set the command to start the service
CMD ["ollama"]