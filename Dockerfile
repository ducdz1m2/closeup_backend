FROM alpine:latest

RUN apk add --no-cache wget unzip

# Tải bản Linux 64-bit của PocketBase
RUN wget -q https://github.com/pocketbase/pocketbase/releases/download/v0.30.4/pocketbase_0.30.4_linux_amd64.zip \
    && unzip pocketbase_0.30.4_linux_amd64.zip \
    && mv pocketbase /pocketbase \
    && chmod +x /pocketbase \
    && rm pocketbase_0.30.4_linux_amd64.zip

# Copy thư mục pb_data (từ local) vào trong container
COPY pb_data /pb_data

EXPOSE 10000

CMD ["/pocketbase", "serve", "--http=0.0.0.0:10000"]
