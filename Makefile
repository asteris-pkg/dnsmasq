ALPINE_VERSION  := 3.3
DNSMASQ_VERSION := 2.75-r1
SIGNING_KEY     := 17BE6741
.PHONY=all

all: dnsmasq-${DNSMASQ_VERSION}-linux-amd64.aci dnsmasq-${DNSMASQ_VERSION}-linux-amd64.aci.asc

dnsmasq-%-linux-amd64.aci: build.sh
	./build.sh $* ${ALPINE_VERSION}

dnsmasq-%-linux-amd64.aci.asc: dnsmasq-%-linux-amd64.aci
	gpg --default-key ${SIGNING_KEY} --detach-sign --output $@ --armor $^
