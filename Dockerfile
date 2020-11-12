FROM autoware/autoware:1.13.0-melodic-cuda
COPY --chown=autoware:autoware bag2video.py /usr/local/bin/bag2video.py
RUN chmod +x /usr/local/bin/bag2video.py
