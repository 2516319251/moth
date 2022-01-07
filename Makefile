build:
	cd /moth/cmd && \
	export GOPROXY=https://goproxy.cn && \
    export GOPRIVATE=*.orayer.com && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main . && \
	rm -rf /moth/dist && \
	mkdir -p /moth/dist/bin && \
    mv /moth/cmd/main /moth/dist/bin/main && \
    chmod -R +x /moth/dist/bin/main && \
	mkdir -p /moth/dist/conf && \
	cp /moth/configs/config.yaml /moth/dist/conf/config.yaml

clean:
	rm -rf /moth/dist
