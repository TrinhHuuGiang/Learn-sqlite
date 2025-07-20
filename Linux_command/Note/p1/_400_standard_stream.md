# Standart stream and return in C programing
- Input arguments using: stdin
- Output using:  stdout, stderr, return [value]

# Handle standard stream and return value in Linux

## Input arguments
1. Syntax
    ```bash
    [program] argv1 argv2 argv3 ... # default argv0 is link to [program] 
    ```

## Output handle

### Redirect output by write to file
- `[command] >   [file]` redirect `stdout` of `command` overwrite on `file`
- `[command] >>  [file]` redirect `stdout` of `command` append on `file`
- `[command] 2>  [file]` redirect `stderr` of `command` overwrite on `file`
- `[command] 2>> [file]` redirect `stderr` of `command` append on `file`
- `[command] &>  [file]` redirect both output of `command` overwrite on `file`
- `[command] &>> [file]` redirect both output of `command` append on `file`

### Redirect output by send to another programs by pipe
- `[command 1] | [command 2] | [command 3] | ... `
    - value `stdout` only from previous `command` is arguments for next command
    - example: `echo "hello" | cat`


## Return value
- The last return value of program can find at `$?`
