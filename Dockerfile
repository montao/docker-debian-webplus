FROM debian
RUN apt update && apt install -y sudo g++ make ccache libjsoncpp-dev libjson-c-dev libssl-dev postgresql-server-dev-11 postgresql-client-11 postgresql-11 libpqxx-dev libconfig++-dev libglibmm-2.4-dev dos2unix git
RUN pg_ctlcluster 11 main start 
RUN cd /app/helpcovid
RUN dos2unix *.py *.sh
RUN make
RUN printf '\n\n\n\n\n\n\n' | ./generate-config.py
RUN make localtest0
