# needed for API compatibility with MIT Krb5
(cd usr/include/gssapi; ln -fs gssapi.h gssapi_generic.h);

# Install new info files
if [ -x usr/bin/install-info ]; then
  usr/bin/install-info usr/info/hx509.info.gz usr/info/dir >/dev/null 2>&1
  usr/bin/install-info usr/info/heimdal.info.gz usr/info/dir >/dev/null 2>&1
fi
