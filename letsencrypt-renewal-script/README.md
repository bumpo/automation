### Bash Script to Renew letsencrypt SSL ###

Warning: Let's Encrypt has an auto-renew bot. This script is intended to be used where official means cannot be applied. 

Lets encrypt renews on 90 day intervals. As such this script will need to be scheduled accordingly via cron: 

```
0 0 1 FEB,MAY,AUG,NOV * sh /root/certrenew.sh
```

If applying this to another server be sure to review paths and adjust accordingly. 

### NOTE ###

Some older versoin of linux distros may not support using abbreviated months in the crontab. For these cases you will need to use the numeric representation: 

1 - Jan  
2 - Feb 

so on. 
