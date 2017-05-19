pip install virtualenv
virtualenv /venv
/venv/bin/pip install credstash==1.11 -t /code
cd /code; zip -r9 /tmp/deployment.zip .
cp /tmp/deployment.zip /build/
