FROM alpine:edge
MAINTAINER Michael Williams <michael.williams@enspiral.com>

RUN apk add --no-cache salt-ssh openssh-client
ENTRYPOINT ["/usr/bin/salt-ssh"]
