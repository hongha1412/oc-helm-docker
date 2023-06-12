FROM willdockerhub/curl-wget

ENV VERIFY_CHECKSUM=false

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
    apk add glibc-2.28-r0.apk && \
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    wget https://downloads-openshift-console.apps.sandbox-m4.g2pi.p1.openshiftapps.com/amd64/linux/oc.tar && \
    tar -xvf oc.tar && \
    chmod +x oc && mv oc /usr/local/bin/oc

RUN mkdir /.kube
RUN chgrp -R 0 /.kube && chmod -R g=u /.kube
RUN chgrp -R 0 . && chmod -R g=u .

CMD sh
