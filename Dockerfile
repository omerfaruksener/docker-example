# Build image with Python 3.12
FROM python:3.12-alpine

# Set working directory
WORKDIR /code

# Install dependencies
COPY requirements.txt .

# Set environment variables used flask command
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#install gcc and other build dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

#Install Python dependencies
RUN pip install -r requirements.txt

#Copy the application code to the container
COPY . .

EXPOSE 5000

#set thr default command for the container to run the flask application
CMD ["flask", "run", "--debug"]

