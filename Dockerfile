FROM ubuntu:latest

RUN apt update && apt install python3-pip python-is-python3 wget git -y 
RUN git clone --depth=1 https://github.com/charlesbel/Microsoft-Rewards-Farmer msfarm
WORKDIR /msfarm
RUN pip install -r requirements.txt && rm -rf .sessions logs .vscode .github
RUN pip install schedule
#COPY accounts.json /msfarm/accounts.json
#COPY sessions /msfarm/sessions
#COPY start.py /msfarm/start.py

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb -f -y

CMD python start.py
#RUN python start.py
