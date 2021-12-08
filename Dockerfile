FROM volition-build-base

WORKDIR /app

COPY . /app

RUN cmake .                 \
    && make volition -j4 VERBOSE=1   \
    && make install         \
    && /sbin/ldconfig -v    \
    && cd ..                \
    && mv /app/volition /tmp/volition \
    && rm -r /app/*         \
    && mv /tmp/volition /app/volition

ENTRYPOINT [ "/app/volition" ]
CMD [ "-c", "/var/lib/volition/volition.ini" ]
