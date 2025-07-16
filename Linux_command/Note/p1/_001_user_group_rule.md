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


<br><hr><br>


