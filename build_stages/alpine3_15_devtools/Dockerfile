FROM kuzishai/alpine3_15_awscliv2:0.2

LABEL maintainer="shai@goperfectmatch.com"
ENV GLIBC_VER=2.31-r0
RUN apk --no-cache add  --virtual .build-deps \
       curl bash bash-completion pkgconfig git jq ncurses \
    && curl -sLO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm -f kubectl  \
    && curl -s "https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz" -o "helm.tar.gz" \
    && tar -zxf helm.tar.gz && \
        mv linux-amd64/helm /usr/local/bin/ && \
        chmod +x /usr/local/bin/helm && \
        rm -rf linux-amd64 && \
        rm -f helm.tar.gz \
    && curl -s "https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip" -o "terraform.zip" \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/terraform \
    && chmod +x /usr/local/bin/terraform \
    && rm -rf terraform.zip \
    && curl -sL "https://github.com/gruntwork-io/terragrunt/releases/download/v0.35.16/terragrunt_linux_amd64" -o /usr/local/bin/tg \
    && chmod +x /usr/local/bin/tg \
    && git clone https://github.com/ahmetb/kubectx.git /opt/.kubectx \
    && mv /opt/.kubectx/kubectx /opt/.kubectx/kctx \
    && mv /opt/.kubectx/kubens /opt/.kubectx/kns \
    && COMPDIR=$(pkg-config --variable=completionsdir bash-completion) \
    && ln -sf /opt/.kubectx/completion/kubens.bash $COMPDIR/kns \
    && ln -sf /opt/.kubectx/completion/kubectx.bash $COMPDIR/kctx \
    && rm -rf /var/cache/apk/*
