FROM python:3.8

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r script/requirements.txt

RUN apt-get update && apt-get -y install cron
RUN chmod +x start.sh

CMD ["./start.sh"]
