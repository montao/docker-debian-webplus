FROM debian
RUN apt update && apt install -y sudo g++ make ccache libjsoncpp-dev libjson-c-dev libssl-dev postgresql-server-dev-11 postgresql-client-11 postgresql-11 libpqxx-dev libconfig++-dev libglibmm-2.4-dev dos2unix git cmake curl libcurl4-openssl-dev
RUN ln -s /usr/include/jsoncpp/json/ /usr/include/json
RUN git clone https://github.com/jpbarrette/curlpp.git 
RUN cd curlpp; mkdir build && cd build; cmake ../;make && make install;cd /
RUN pg_ctlcluster 11 main start 
RUN mkdir /app; mkdir /app/helpcovid;cd /app/helpcovid
RUN touch 1.py; touch 1.sh;dos2unix *.py *.sh; [ -f /app/helpcovid/Makefile ] && make; [ -f /app/helpcovid/generate-config.py ] && printf '\n\n\n\n\n\n\n' | ./generate-config.py; [ -f /app/helpcovid/Makefile ] && make localtest0; rm 1.py; rm 1.sh
