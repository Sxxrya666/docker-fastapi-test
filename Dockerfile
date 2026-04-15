FROM python:3.13-alpine as builder  

WORKDIR /usr/src/app

COPY requirements.txt ./  

RUN pip install --upgrade pip && \
  pip install --no-cache-dir --upgrade -r requirements.txt 

COPY ./ ./

# USER 1000

EXPOSE 22000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0",  "--port", "22000", "--reload"]