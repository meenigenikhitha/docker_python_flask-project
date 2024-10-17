FROM python:3.6  AS build
WORKDIR /usr/app/
COPY requirements.txt /usr/app/
RUN pip install -r requirements.txt
COPY --from=build /usr/local/lib/python:3.6/site-packages /usr/local/lib/python:3.6/site-packages
COPY --from=build /usr/local/bin/
COPY ./usr/app/
EXPOSE 5000
CMD ["python", "app.py"]
