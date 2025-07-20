# Command `grep`
- Function: Search value by rows
- Test file:
    ```bash
    touch "test_grep_cut.temp"

    {
    hello="hello\!\n"
    hello="${hello}this is test \`grep\` file\n"
    hello="${hello}one two three four five oNe two three four five\n"
    hello="${hello}six seVen eight nine ten\n"
    hello="${hello}oNe twO three four five One two thrEe four five\n"

    echo -e "$hello">"test_grep_cut.temp" # -e is handle special keyword \n , \` ,...
    }

- Command:
    - search all row include "keyword":
        `grep "keyword" [filename]` -> example: `grep "one two" "test_grep_cut.temp"`
    - search all row with row index
        `grep -n "keyword" [filename]`
    - search all row with case insensitve `A == a`
        `grep -i -n "keyword" [filename]`

# Command `cut`
- Function: Search value by column
