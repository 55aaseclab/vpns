# vpns

Docker-based VPN setups that expose a local HTTP proxy. Currently includes an EPFL VPN setup using OpenConnect, TOTP authentication, and Tinyproxy.

## Quick start

Requires Docker with Docker Compose and support for `/dev/net/tun`.

1. Clone the repository and enter the EPFL setup:

   ```sh
   git clone git@github.com:55aaseclab/vpns.git
   cd vpns/epfl
   ```

2. Create a `.env` file with your EPFL credentials and base32 TOTP secret:

   ```dotenv
   VPN_USER=your-username
   VPN_PASS=your-password
   MFA_SECRET=your-base32-totp-secret
   ```

   Keep this file private; it is excluded from Git.

3. Build and start the VPN proxy:

   ```sh
   docker compose up -d --build
   ```

4. Send requests through the local proxy:

   ```sh
   curl --proxy http://127.0.0.1:3049 https://www.epfl.ch
   ```

Use `docker compose logs -f` to view logs and `docker compose down` to stop the service.

## License

Licensed under the [MIT License](LICENSE). Copyright (c) 2026 55AA Security Lab.
