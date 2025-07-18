# Manage user
1. List user information
2. Manage users

<br><hr><br>

## 1. List user information
- Open file descript users `passwd` only with read only:
    - Use `less` -> `less /etc/passwd`
    - User description field
        - [username]: [hiden_password]: [userid]: [groupid]: [fullname]: [user_folder]: [access_files]
- Superuser open password encripted file `shadow` only with read only:
    - Use `less` -> `sudo less /etc/shadow`

<br><hr><br>


## 1. Manage users
- `id username`: user identification information
- `adduser username`: add new user with `username`
- `deluser username`: delelte user with `username`
- `passwd username`: change user password
- `usermod -aG group_1,group_2 username`: add user to some new groups, if missing `-a` will clean all old groups

<br><hr><br>

## 2. Change owner/rule
- Note: use sudo if can't execute change
- To see rule set of a file/folder type: `ls -la file_folder_name`
    ``` bash
    ls -la cert_chain.pem 
    
    -rw-r--r-- 1 giangtrinh giangtrinh 3631 Jun 23 11:24 cert_chain.pem
    ^^^^^^^^^^ ^      ^          ^       ^         ^
    |||||||||| link owner      group  size(Byte) date_modify
    0123123123
    ||  |  └─ others (rwx)
    ||  └─ group (rwx)
    |└─ user (rwx - read,write,execute)
    └─ type(`-` is normal file, `d` is directory, ...)

- Chage owner type: 
    - `chown newuser.newgroup file_folder_name` <- change new ower + group
    - `chown newuser file_folder_name` <- change new owner
    - `chown .newgroup file_folder_name` <- change new group
    ``` bash
    chown guest cert_chain.pem

    -rw-r--r-- 1 guest giangtrinh 3631 Jun 23 11:24 cert_chain.pem

<br><hr><br>

- Change rule of file:
    - `chmod u+w file_folder_name` <- add write permission for userowner
    - `chmod g+w file_folder_name` <- add write permission for groupowner
    - `chmod o+w file_folder_name` <- add write permission for others
    - similar with `u+r`, `u+x`, ...
    - faster: `chmod u+rwx,g+rwx,o+rwx file_folder_name` ...
    ---
    - otherwise use -w,-r,-x to remove permissions

    --- 
    - another setup:
        - `rwx` == 3 bit from (000 - 111) == Decimal from 0 - 7
        ```bash
        Ex: chmode 753 file_folder_name = `rwx` `r-x` `-wx`
                                         user   group others