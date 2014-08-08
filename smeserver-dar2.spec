# $Id: smeserver-dar2.spec,v 1.2 2013/07/14 16:24:30 unnilennium Exp $
# Authority: darrellmay
# Name: Darrell May

Summary: Disk ARchive for SME Server
%define name smeserver-dar2
Name: %{name}
%define version 0.0.1
%define release 32
Version: %{version}
Release: %{release}%{?dist}
License: GPL
Group: SME/addon
Source: %{name}-%{version}.tar.gz
BuildRoot: /var/tmp/%{name}-%{version}-%{release}-buildroot
BuildArchitectures: noarch
Requires: dar => 2.3.1
Requires: smeserver-release => 7.0
Requires: e-smith-formmagick >= 1.4.0-12
BuildRequires: e-smith-devtools >= 1.13.1-03
%description
SME Server implementation of Disk ARchive (http://dar.linux.free.fr)
based on smeserver-backup2.

%changelog
* Sun Jul 14 2013 JP Pialasse <tests@pialasse.com> 0.0.1-32.sme
- apply locale 2013-07-14 patch

* Tue Mar 20 2012 SME Translation Server <translations@contribs.org> 0.0.1-31.el6
- apply locale 2012-03-20 patch

* Sun Mar 06 2011 SME Translation Server <translations@contribs.org> 0.0.1-30.sme
- apply locale 2011-03-06 patch

* Sun May 23 2010 SME Translation Server <translations@contribs.org> 0.0.1-29.sme
- apply locale 2010-05-23 patch

* Tue Mar 02 2010 SME Translation Server <translations@contribs.org> 0.0.1-28.sme
- apply locale 2010-03-02 patch

* Wed Oct 21 2009 SME Translation Server <translations@contribs.org> 0.0.1-27.sme
- apply locale 2009-10-21 patch

* Mon Aug 24 2009 SME Translation Server <translations@contribs.org> 0.0.1-26.sme
- apply locale 2009-08-24 patch

* Wed May 20 2009 SME Translation Server <translations@contribs.org> 0.0.1-25.sme
- apply locale 2009-05-20 patch

* Mon Apr 27 2009 SME Translation Server <translations@contribs.org> 0.0.1-24.sme
- apply locale 2009-04-27 patch

* Tue Mar 03 2009 SME Translation Server
- apply locale 2009-03-03 patch

* Sun Mar  1 2009 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-22
- Apply  1 Mar 2009 locale patch [SME: 5018]

* Sat Jan 31 2009 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-21
- Apply 31 Jan 2009 locale patch [SME: 4951]

* Thu Jan  1 2009 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-20
- Apply  1 Jan 2009 locale patch [SME: 4900]

* Wed Nov  5 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-19
- Apply  5 Nov 2008 locale patch

* Tue Oct 14 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-18
- Apply 14 Oct 2008 locale patch

* Tue Jul 1 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-17
- Apply 1 July 2008 locale patch

* Wed Jun 25 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-16
- Actually apply 25 Jun 2008 locale patch, forgot to commit patch

* Wed Jun 25 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-15
- Apply 25 Jun 2008 locale patch

* Fri May 30 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-14
- Apply 30 May 2008 locale patch

* Thu May 21 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-13
- Apply 21 May 2008 locale patch

* Mon May 5 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-12
- Apply 5 May 2008 locale patch
- Updated e-smith-formmagick requirement

* Mon Apr 28 2008 Shad L. Lords <slords@mail.com> 0.0.1-11
- Bump release to rebuild

* Sat Apr 26 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-10
- Take common <base> entries from e-smith-formmagick's general

* Wed Apr 23 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-9
- Fix changelog day

* Wed Apr 23 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-8
- Apply Mar 23 2008 translation patch

* Tue Apr 22 2008 Jonathan Martens <smeserver-contribs@snetram.nl> 0.0.1-7
- Apply Mar 22 2008 translation patch

* Sun Apr 20 2008 Shad L. Lords <slords@mail.com> 0.0.1-6
- Remove scripts (not needed anymore)

* Sun Apr 20 2008 Shad L. Lords <slords@mail.com> 0.0.1-5
- Clean up translations to work with pootle
- Apply Mar 20 2008 translation patches

* Wed Aug 22 2007 Shad L. Lords <slords@mail.com> 0.0.1-4
- Clean up spec so package can be built by koji/plague
- Update to new release naming.  No functional changes.
- Make Packager generic

* Thu Mar 22 2007 Darrell May <dmay@myezserver.com>
- updated actions/dar2-backup to separately zip and backup up dbs
- updated actions/dar2-mc to require only job name to launch
- [0.0.1-3dmay] smeserver-dar2-0.0.1-3.patch
* Fri Mar 16 2007 Darrell May <dmay@myezserver.com>
- updated dar2 panel text: absolute/relative pathing
- updated dar2 panel text: prune wildcard support
- [0.0.1-2dmay] smeserver-dar2-0.0.1-2.patch
* Sun Jan 07 2007 Darrell May <dmay@myezserver.com>
- added dar2-mc action
- added dar support files for Midnight Commander
- [0.0.1-1dmay]
* Fri Oct 19 2006 Darrell May <dmay@myezserver.com>
- BT:1988 added disk usage to report
- official release
- [0.0.1-0dmay]
* Mon Oct 16 2006 Darrell May <dmay@myezserver.com>
- BT:1979 German language file added
- BT:1982 fix navigation-conf generated error
- [0.0.1-b8dmay]
* Wed Oct 11 2006 Darrell May <dmay@myezserver.com>
- BT:1974 verbose prop now controls log file generation, default 'off'
- [0.0.1-b7dmay]
* Wed Oct 11 2006 Darrell May <dmay@myezserver.com>
- major rewrite of dar2-backup/restore templates
- minor updates to action scritps adding more echo statements
- [0.0.1-b6dmay]
* Mon Oct 09 2006 Darrell May <dmay@myezserver.com>
- BT:1966 edited Exclude/Prune labels & switched display order
- added archive listing to dar2-backup output 
- [0.0.1-b5dmay]
* Sat Oct 07 2006 Darrell May <dmay@myezserver.com>
- BT:1964 crontab
- [0.0.1-b4dmay]
* Fri Oct 06 2006 Darrell May <dmay@myezserver.com>
- added dar2-dr-restore, a disaster recovery restore script.
- [0.0.1-b3dmay]
* Thu Oct 05 2006 Darrell May <dmay@myezserver.com>
- added db prop Verbose to control backup output detail
- [0.0.1-b2dmay]
* Thu Oct 05 2006 Darrell May <dmay@myezserver.com>
- update actions dar2-backup/restore to support custom mount points
- [0.0.1-b1dmay]
* Wed Oct 04 2006 Darrell May <dmay@myezserver.com>
- initial beta release
- [0.0.1-b0dmay]
* Mon Oct 02 2006 Darrell May <dmay@myezserver.com>
- drop db backup2 defaults
- edit panel name to Disk ARchive
- [0.0.1-a7dmay]
* Sun Oct 01 2006 Darrell May <dmay@myezserver.com>
- initial public alpha release
- [0.0.1-a6dmay]
* Sun Oct 01 2006 Darrell May <dmay@myezserver.com>
- initial rebuild on Restore panel
- [0.0.1-a5dmay]
* Fri Sep 29 2006 Darrell May <dmay@myezserver.com>
- initial rebuild on View/Modify, Backup, Remove panels
- added Expiry to dar2-backup script
- [0.0.1-a4dmay]
* Thu Sep 28 2006 Darrell May <dmay@myezserver.com>
- server-manager panel debugging
- [0.0.1-a3dmay]
* Thu Sep 28 2006 Darrell May <dmay@myezserver.com>
- server-manager panel debugging
- [0.0.1-a2dmay]
* Wed Sep 27 2006 Darrell May <dmay@myezserver.com>
- initial server-manager panel build
- [0.0.1-a1dmay]
* Wed Sep 27 2006 Darrell May <dmay@myezserver.com>
- initial internal alpha release
- [0.0.1-a0dmay]

%prep

%setup



%build
/usr/bin/perl createlinks

%install
/bin/rm -rf $RPM_BUILD_ROOT

(cd root   ; /usr/bin/find . -depth -print | /bin/cpio -dump $RPM_BUILD_ROOT)
/bin/rm -f %{name}-%{version}-filelist
/sbin/e-smith/genfilelist $RPM_BUILD_ROOT > %{name}-%{version}-filelist
%files -f %{name}-%{version}-filelist

%defattr(-,root,root)

%clean
/bin/rm -rf $RPM_BUILD_ROOT

