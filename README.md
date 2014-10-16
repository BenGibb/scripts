SCRIPTS
=======

* `clean-solution.ps1` - deletes unnecessary objects [bin, pdb, obj, ...] from a solution.
* `chocolatey-versions.ps1` - lists current versions of installed packages

SublimeText
-------------

Contains custom scripts and user configs. Uses these plugins:

 * RegReplace

Commands 
========

* `start-server` - starts a HTTP server in the current folder, listening on port 8000
* `chocolatey-versions` - lists the current versions of all Chocolatey packages
* `kill-webservers` - kills all the Visual Studio web servers. For those cases when a stupid project launches 40 of them on build an I only notice when it's too late.