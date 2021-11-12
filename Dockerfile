FROM public.ecr.aws/lts/ubuntu:latest

RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python -y
RUN apt-get install python3-pip -y

COPY ./requirements.txt app/requirements.txt 
RUN ls
WORKDIR /app
RUN pip3 install -r requirements.txt --no-cache-dir
RUN pip3 install Flask Flask-RESTful gunicorn
WORKDIR /app
COPY . .
RUN ls
EXPOSE 5000
CMD ["python3", "app.py"]
