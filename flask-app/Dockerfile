# Use Python 3.7 as a base image
FROM python:3.7

# Set the working directory in the container
WORKDIR /app

# Copy contents into the image
COPY . /app

# Install pip dependencies from requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Expose the correct port for the Flask app
EXPOSE 5000

# Create an entrypoint to run the application
ENTRYPOINT ["python", "app.py"]
