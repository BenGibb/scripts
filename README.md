SCRIPTS
=======

This is my scratchpad/misc script dump. Some of the contents:

* `Clear-Solution.psm1` - deletes unnecessary objects [bin, pdb, obj, ...] from a Visual Studio solution. 
* `csvtosqlite.py` - removed from this repo and moved to [its own](https://github.com/zblesk/csv-to-sqlite). You can install it by `pip install csv-to-sqlite`.
* Scripts in `ps-commands.ps1` are mostly obsolete now.
    * `start-server` - starts a HTTP server in the current folder, listening on port 8000
    * `chocolatey-versions` - lists the current versions of all Chocolatey packages
    * `kill-webservers` - kills all the Visual Studio web servers. For those cases when a stupid project launches 40 of them on build an I only notice when it's too late.
* `Send-MailgunEmail.ps1` - feed it parameters and it sends an email via the v3 version of MailGun API.

SublimeText
-------------

Contains custom scripts and user configs. Uses these plugins:

 * RegReplace


