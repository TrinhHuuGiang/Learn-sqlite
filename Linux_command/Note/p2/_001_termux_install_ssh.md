# Test on
- server: Android version >=5 and Limux Termux CLI (download newest from [Github](https://github.com/termux/termux-app/releases))
- client: Ubuntu WSL
- DNS: DuckDNS
- Router port: 1024
- Server port: 1024 <= Android refuse open port 0 - 1023 if not root
- Network troubleshooting: Ask your `ISP` change `CGNAT IP` -> `Dynamic Public IP` if can't connect to Server IP

<br><hr><br>

### Install SSH
- Refer from: https://wiki.termux.com/wiki/Remote_Access
- Note: 
    + default server ssh port is 8022 but here using 1024
    + default authentication is password but here using pulic key

<br><hr><br>

### Config port forward on router
- Login your router, set port forward to a Static IP
- NAT WAN_IP:port with Server_IP:port
    - Here i set forward router port 1024 - server port 1024

<br><hr><br>

### Register a DNS
- Register new free DNS: https://www.duckdns.org/
    - Example result if success: `giangtrinh@duckdns.org`
    - And each account have a `token`: check some where on web
- Now ping from server to DuckDNS to update new ip by `curl`:
    - `curl "https://www.duckdns.org/update?domains=[domain_name]&token=[token]"`
    - [refer](https://www.duckdns.org/spec.jsp)
<br><hr><br>

### Download
- Download `openssh` on server
    ```bash
    pkg install openssh
    ```
---
- Download `openssh` on WSL for clients

<br><hr><br>

### Setup SSH on server
- Call `id` then remember unique username on `Termux`: uid=id(username)
---
- Config `sshd` (SSH Daemon) handle new connect on port 1024 of server:
    - check default authentication mode `cat $PREFIX/etc/ssh/sshd_config`

    - Sure enable `PasswordAuthentication yes` by using `vi`:
        ``` bash
        pkill sshd <!-- kill old ssh daemon service before setup Public key mode -->

        vi $PREFIX/etc/ssh/sshd_config

        now change =>> [PasswordAuthentication yes]

        now can change old user password or not =>> passwd

        ssdh -p 1024 <!-- Rerun ssh server on port 1024 -->
        ```

    - Note this step will get :
        - Now try go to `cd ~/.ssh` here we have file `authorized_keys`
        - Get public key from [Setup SSH on client](#setup-ssh-on-client)
        - For auto append to this list, first try login to `sshd` from client by `PasswordAuthentication` mode
            - Example from client side: 
                ``` bash
                ssh-copy-id -p 1024 -i ~/key_gen/termux_sv1_rsa IP_ADDRESS_or_HOSTNAME 
                <!-- Save new public key on server -->  
                <!-- Bash ask login password before save new public key -->
                ```

            - `IP_ADDRESS` can change by DNS like DuckDNS above `giangtrinh@duckdns.org`
            - Not in put extra file type `.pub`, ssh will handle it
            - If success, a log like this popup:
                ```bash
                Number of key(s) added: 1

                Now try logging into the machine, with:   "ssh -p '1024' 'giangtrinh.duckdns.org'"
                and check to make sure that only the key(s) you wanted were added.


    - Ok now disable `PasswordAuthentication` on server by using `vi` for using Public key mode:
        ``` bash
        pkill sshd <!-- kill ssh daemon service before setup Public key mode -->

        vi $PREFIX/etc/ssh/sshd_config

        now change [PasswordAuthentication no]
        ```
    - Go to [connect](#connect)

<br><hr><br>

### Setup SSH on client
- Try generate a key pair:
    - First create a folder at `~` or somewhere you like
        - Example: 
        ```bash
        mkdir ~/key_gen
        ```
    - `ssh-keygen -t rsa -b 2048 -f file_link` to get public key 2048bit
        - Example: 
        ```bash
        ssh-keygen -t rsa -b 2048 -f ~/key_gen/termux_sv1_rsa
        ```
    - Now we have 2 file `termux_sv1_rsa` and `termux_sv1_rsa.pub`
        - Return [Setup SSH on server](#setup-ssh-on-server) and write ssh pulic key in `termux_sv1_rsa.pub` to server.
        - The private key `termux_sv1_rsa` keep in client

<br><hr><br>

### Connect
- Type `ssh -p 1024 -i key_link username@IP_or_DNS` to login server `Termux`
    - Example: `ssh -p 1024 -i ~/key_gen/termux_sv1_rsa u0_a75@giangtrinh.duckdns.org`
    -> Very farst (no login, system auto pulic key, exchange, challenge, setup session)
