FROM ubuntu as build
RUN apt update && apt install -y curl
RUN curl -LJO https://github.com/in4it/openvpn-onelogin-auth/releases/download/0.0.4/openvpn-onelogin-auth-linux-amd64 && mv ./openvpn-onelogin-auth-linux-amd64 /bin/openvpn-onelogin-auth

FROM kylemanna/openvpn
COPY --from=build /bin/openvpn-onelogin-auth /bin/
RUN chmod +x /bin/openvpn-onelogin-auth
