# TODO

* Don't copy everything into the container
  * we don't want the local folder since modules may buidl differently on different architectures
  * We don't want pg-data since it's already elsewhere on the container
* review structure ideas on <https://stackoverflow.com/questions/26598738/how-to-create-user-database-in-script-for-docker-postgres>

* Can we develop exculsively in container and not run app locally?
  * How to detect changes and restart server
  * How to build different for dev vs prod?
  * Fix up README

* Put DB connection into config
  * Different config for dev vs prod

* Distinguish what's copied to image vs what is mirrored there - what is dockerfile vs compose vs cli command
