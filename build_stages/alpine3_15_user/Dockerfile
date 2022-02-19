FROM kuzishai/alpine3_15_devtools:0.1

LABEL maintainer="shai@goperfectmatch.com"
SHELL ["/bin/sh", "-c"]
ARG user=shai
ARG home=/home/$user
RUN addgroup -S docker
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home $home \
    --ingroup docker \
    $user
WORKDIR $home
USER $user

COPY --chown=$user start.sh .
RUN chmod +x start.sh
ENTRYPOINT ["./start.sh"]
