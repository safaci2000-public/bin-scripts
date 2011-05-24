Git-CVS
-------

Get a proper cvs checkout
~~~~~~~~~~~~~~~~~~~~~~~~~

 * cvs checkout   -d bar-cvs  Module/foo/bar
 * Get a git checkout: mkdir module && cd module && git cvsimport Module/foo/bar

Commit Upstream
~~~~~~~~~~~~~~~
 * git cvsexportcommit -c -p -v -w $HOME/projects/forececast/forecast-cvs <HASHID>
 
Update from Upstream
~~~~~~~~~~~~~~~~~~~~
 * git cvsimport -a -k -u -v -m -p -Z,9  Module/foo/bar 

Misc Git
--------

Create empty branch
~~~~~~~~~~~~~~~~~~~

[source,bash]
git symbolic-ref HEAD refs/heads/newbranch 
rm .git/index 
git clean -fdx 
<do work> 
git add your files 
git commit -m 'Initial commit'
