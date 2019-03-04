### Script to auatomte updates of vagrant images on cicdbig ###

Ensure the paths are correct/ updated. Additionally it will need to write to an update log which can be created
by creating an empty file in a path readable and writable by the user running the script. Currently this is: 

```
/home/user/log/updates.log
```

Additoinally this script runs on a weekly cron which looks as follows: 
```
MAILTO=youremail@here.com

0 0 * * 3 sh /home/user/scripts/updates.sh
```

The MAILTO section ensures any failures to run are reported to your email
