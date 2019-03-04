### How to use this script ###

1. Fill in the empty variables with the relevant data

2. Run script with sudo/root


### One liner for imports ###
The following imports all .sql files in the directory. 

`for SQL in *.sql; do DB=${SQL/\.sql/}; echo importing $DB; mysql -h<host here> -u<USER HERE> -p<Password here> $DB < $SQL; done`
                                                                                                                          
Run this as root to limit exposure of command history to privileged users only. History can be cleared for additional security, or configured to not save command history.                                                                                                                   
