FROM python:3-slim

RUN apt-get update && \
    apt-get -qqqy install wget git && \
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get -qqqfy install ./google-chrome-stable_current_amd64.deb && \
    rm -f ./google-chrome-stable_current_amd64.deb

RUN git clone --depth=1 https://github.com/charlesbel/Microsoft-Rewards-Farmer msfarm

WORKDIR /msfarm

RUN pip install -r requirements.txt schedule --no-cache-dir && \
    rm -rf .sessions logs .vscode .github

#COPY accounts.json /msfarm/accounts.json
#COPY sessions /msfarm/sessions
#COPY start.py /msfarm/start.py

CMD python start.py
#RUN python start.py
