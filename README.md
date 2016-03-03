# DNSMasq

This repo packages DNSMasq for use in [rkt](https://coreos.com/rkt) with
[Consul](https://www.consul.io).

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [DNSMasq](#dnsmasq)
    - [Use](#use)
    - [Hacking](#hacking)
    - [License](#license)

<!-- markdown-toc end -->

## Use

This image is specifically set up to forward Consul DNS from `127.0.0.1:8600` to
`127.0.0.1:53`. You should probably run it in the same pod as Consul.

## Hacking

With [`acbuild`](https://github.com/appc/acbuild) installed, run `make
dnsmasq-latest-linux-amd64.aci` or `make all` to create and sign.

## License

See [LICENSE](LICENSE).
