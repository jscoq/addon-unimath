
REPO = https://github.com/UniMath/UniMath.git
TAG = v20230420
WORKDIR = workdir

build: $(WORKDIR)
	(cd $(WORKDIR) ; git pull)
	dune build

$(WORKDIR):
	git clone --recursive --depth=1 -c advice.detachedHead=false -b $(TAG) $(REPO) $(WORKDIR)

# To install jsCoq SDK
setup:
	docker pull jscoq/jscoq:sdk
	docker tag jscoq/jscoq:sdk jscoq:sdk
	rm -rf /tmp/jscoq-sdk  # cleanup in case there was a previous build there

clean:
	dune clean
