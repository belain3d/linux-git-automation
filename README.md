# Linux Git Automation
Git Automation process made for Linux distros.<br>
This was made because of the repetetive token request on Linux distros.<br>
You need to configure your username, token, and git repository in the ga.sh script.<br>
<br>
The commands are almost the same as git's, however you should run the .sh script with the --help argument for further information.

> ./ga.sh --help
```
--------------------------------------------------
| ./ga.sh add filename (or .)                    |
| ./ga.sh commit "message"                       |
| ./ga.sh push |branch|                          |
| ./ga.sh pull |branch|                          |
| ./ga.sh status                                 |
| ./ga.sh clone                                  |
| ./ga.sh branch |-d|--delete|branch|            |
| ./ga.sh checkout |branch|                      |
--------------------------------------------------
```

Optionally, you could put the ga.sh script to your ```/usr/local/bin``` directory without the .sh extension (ga). This will
allow you to run the program from any directory. Don't forget to change your authentication though!
