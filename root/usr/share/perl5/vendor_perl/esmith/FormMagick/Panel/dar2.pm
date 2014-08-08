#!/usr/bin/perl -w 
package esmith::FormMagick::Panel::dar2;

use strict;
use warnings;
use esmith::FormMagick;
use esmith::ConfigDB;
use esmith::cgi;
use esmith::util;
use File::Basename;
use Exporter;
use Carp qw(verbose);

our @ISA = qw(esmith::FormMagick Exporter);

our @EXPORT = qw();

our $VERSION = sprintf '%d.%03d', q$Revision: 1.1 $ =~ /: (\d+).(\d+)/;

our $db = esmith::ConfigDB->open('dar2') or die "Couldn't open ConfigDB\n";

# Set global variables
my @dar2 = ();
@dar2 = $db->get_all_by_prop(type => 'dar2');

sub add_quotes( $ )
{
  return '"' . $_[0] . '"';
}

sub zero_or_positive
{
  my $self = shift;
  my $val = shift || 0;

  return 'OK' if($val =~ /^\d+$/ and $val >= 0);
  return $self->localise('VALUE_ZERO_OR_POSITIVE');
}

sub get_drbackup
{
    use esmith::Backup;
    my $backup = esmith::Backup->new();
    return join "\n", map { "$_" } sort($backup->restore_list);
}

sub get_description_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Description');
}

sub get_dr_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'DR');
}

sub get_backup_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;
    my $Backup = $db->get_prop($jobname, 'Backup');
    my @Backup = sort(split(/,/, $Backup));

    return join "\n", map { "$_" } @Backup;
}

sub get_exclude_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    my $Exclude = $db->get_prop($jobname, 'Exclude');
    my @Exclude = sort(split(/,/, $Exclude));

    return join "\n", map { "$_" } @Exclude;
}

sub get_prune_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    my $Prune = $db->get_prop($jobname, 'Prune');
    my @Prune = sort(split(/,/, $Prune));

    return join "\n", map { "$_" } @Prune;
}

sub get_target_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Target');
}

sub get_username_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Username');
}

sub get_password_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Password');
}

sub get_vfstype_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'VFSType');
}

sub get_slice_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Slice');
}

sub get_compression_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Compression');
}

sub get_expiry_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Expiry');
}

sub get_verbose_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'Verbose');
}

sub get_backupday_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'backupDay');
}

sub get_backuptime_value
{
    my $self = shift;
    my $q = $self->{cgi};

    my $jobname = $q->param('jobname') || undef;

    return $db->get_prop($jobname, 'backupTime');
}

sub print_backup_jobs_table
{
    my $self = shift;
    my $q = $self->{cgi};

    if ("@dar2" eq "")
    {
        print $q->Tr($q->td ($q->b ($self->localise('NO_BACKUP_JOBS'))));
        return "";
    }
    else
    {
    print "  <tr>\n    <td colspan=\"2\">\n      ";
    print $q->start_table ({-CLASS => "sme-border"}),"\n        ";
    print $q->Tr(
    esmith::cgi::genSmallCell($q, $self->localise('JOBNAME'),"header"),
    esmith::cgi::genSmallCell($q, $self->localise('DESCRIPTION'),"header"),
    esmith::cgi::genSmallCell($q, $self->localise('TARGET'), "header"),
    esmith::cgi::genSmallCell($q, $self->localise('ACTION'),"header",4));

    my $scriptname = basename($0);
    my $index=0;

    foreach my $dar2 (@dar2)
        {
        my $BackupJob = $dar2->key;
        my $rec = $db->get("$BackupJob");
        my $Description = $rec->prop("Description");
	my $Target = $rec->prop("Target");
        my $modify  = $self->localise('MODIFY');
        my $backup  = $self->localise('BACKUP');
        my $restore = $self->localise('RESTORE');
        my $remove  = $self->localise('REMOVE');
        my $href = "$scriptname?page=0&page_stack=&Next=Next&wherenext";

        my $action1 = "<a href=\"$href=DAR2_PAGE_MODIFY&jobname=$BackupJob\">$modify</a>";
        my $action2 = "<a href=\"$href=DAR2_PAGE_BACKUP&jobname=$BackupJob\">$backup</a>";
        my $action3 = "<a href=\"$href=DAR2_PAGE_RESTORE&jobname=$BackupJob\">$restore</a>";
        my $action4 = "<a href=\"$href=DAR2_PAGE_REMOVE&jobname=$BackupJob\">$remove</a>";
        
        print $q->Tr(
            esmith::cgi::genSmallCell($q, "$BackupJob","normal"),"        ",
    	    esmith::cgi::genSmallCell($q, "$Description","normal"),"        ",
            esmith::cgi::genSmallCell($q, "$Target","normal"),"        ",
	    esmith::cgi::genSmallCell($q, "$action1","normal"),"        ",
            esmith::cgi::genSmallCell($q, "$action2","normal"),"        ",
	    esmith::cgi::genSmallCell($q, "$action3","normal"),"        ",
            esmith::cgi::genSmallCell($q, "$action4","normal"));
	}
    $index++;

    print qq(</table></td></tr>\n);

    return "";
    }
}

sub create_modify_backup
{
    my $fm = shift;
    my $q = $fm->{'cgi'};

    my $jobname = $q->param("jobname");
    $db->new_record("$jobname", {type => 'dar2'});

    my $Backup = $q->param("backup");
    $Backup =~ s/\r\n/,/g;
    $db->set_prop("$jobname", 'Backup', "$Backup");        

    my $Exclude = $q->param("exclude");
    $Exclude =~ s/\r\n/,/g;
    $db->set_prop("$jobname", 'Exclude', "$Exclude");        

    my $Prune = $q->param("prune");
    $Prune =~ s/\r\n/,/g;
    $db->set_prop("$jobname", 'Prune', "$Prune");    

    my $Target = $q->param("target");
    $db->set_prop("$jobname", 'Target', "$Target");
    my $Username = $q->param("username");    
    $db->set_prop("$jobname", 'Username', "$Username");
    my $Password = $q->param("password");    
    $db->set_prop("$jobname", 'Password', "$Password");

    if (("$Username" ne '') && ("$Password" ne ''))
	{
        $db->set_prop("$jobname", 'Mount', '/mnt/dar2');
	}
	else
	{
	$db->set_prop("$jobname", 'Mount', "$Target");
	}
    
    $db->set_prop("$jobname", 'Description', $q->param("description"));
    $db->set_prop("$jobname", 'VFSType', $q->param("vfstype"));
    $db->set_prop("$jobname", 'Slice', $q->param("slice"));
    $db->set_prop("$jobname", 'Compression', $q->param("compression"));
    $db->set_prop("$jobname", 'Expiry', $q->param("expiry"));
    $db->set_prop("$jobname", 'Verbose', $q->param("verbose"));
    $db->set_prop("$jobname", 'backupDay', $q->param("backupday"));
    $db->set_prop("$jobname", 'backupTime', $q->param("backuptime"));
    $db->set_prop("$jobname", 'status', 'enabled');

    unless ( system ("/sbin/e-smith/expand-template", "/etc/crontab") == 0 )
    {
        $fm->error('ERROR_UPDATING');
        return undef;
    }

    $fm->success('SUCCESS');
}

sub perform_backup
{
    my $fm = shift;
    my $q = $fm->{'cgi'};

    my $jobname = $q->param("jobname");

    if ($jobname)
    {
    esmith::util::backgroundCommand(
            5,
            "/etc/e-smith/events/actions/dar2-backup",
            "$jobname"
        );
    }

    $fm->success('SUCCESS');
    return "";
}

sub restore_backup
{
    my $fm = shift;
    my $q = $fm->{'cgi'};

    my $jobname = $q->param("jobname");

    $db->new_record("Restore.$jobname", {type => 'dar2Restore'});
    $db->set_prop("Restore.$jobname", 'Date', $q->param("date"));
    $db->set_prop("Restore.$jobname", 'DR', $q->param("dr"));

    my $Restore = $q->param("restore");
    $Restore =~ s/\r\n/,/g;
    $db->set_prop("Restore.$jobname", 'Restore', "$Restore");                

    $db->set_prop("Restore.$jobname", 'RestoreTo', $q->param("restoreto"));

    if ($jobname)
    {
    esmith::util::backgroundCommand(
            5,
            "/etc/e-smith/events/actions/dar2-restore",
            "$jobname"
        );
    }

    $fm->success('SUCCESS');
    return "";
}

sub remove_backup
{
    my $fm = shift;
    my $q = $fm->{'cgi'};

    my $jobname = $q->param("jobname");

    if ($jobname)
    {
    $db->get($jobname)->delete;
    }
    
    unless ( system ("/sbin/e-smith/expand-template", "/etc/crontab") == 0 )
    {
        $fm->error('ERROR_UPDATING');
        return undef;
    }

    $fm->success('SUCCESS');
    return "";
}

1;
