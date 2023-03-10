# Week 3

#### Website Content

# Hardening WordPress

Security in WordPress is [taken very seriously](https://wordpress.org/about/security/), but as with any other system there are potential security issues that may arise if some basic security precautions aren’t taken. This article will go through some common forms of vulnerabilities, and the things you can do to help keep your WordPress installation secure.

This article is not the ultimate quick fix to your security concerns. If you have specific security concerns or doubts, you should discuss them with people whom you trust to have sufficient knowledge of computer security and WordPress.

Fundamentally, security *is not* about perfectly secure systems. Such a thing might well be impractical, or impossible to find and/or maintain. What security is though is risk reduction, not risk elimination. It’s about employing all the appropriate controls available to you, within reason, that allow you to improve your overall posture reducing the odds of making yourself a target, subsequently getting hacked.

**Website Hosts**

Often, a good place to start when it comes to website security is your hosting environment. Today, there are a number of options available to you, and while hosts offer security to a certain level, it’s important to understand where their responsibility ends and yours begins. Here is a good article explaining the complicated dynamic between [web hosts and the security of your website](http://perezbox.com/2014/11/how-hosts-manage-your-website-security/). A secure server protects the privacy, integrity, and availability of the resources under the server administrator’s control.

Qualities of a trusted web host might include:

- Readily discusses your security concerns and which security features and processes they offer with their hosting.
- Provides the most recent stable versions of all server software.
- Provides reliable methods for backup and recovery.

Decide which security you need on your server by determining the software and data that needs to be secured. The rest of this guide will help you with this.

**Website Applications**

It’s easy to look at web hosts and pass the responsibility of security to them, but there is a tremendous amount of security that lies on the website owner as well. Web hosts are often responsible for the infrastructure on which your website sits, they are not responsible for the application you choose to install.

To understand where and why this is important you must [understand how websites get hacked](https://blog.sucuri.net/2015/05/website-security-how-do-websites-get-hacked.html), Rarely is it attributed to the infrastructure, and most often attributed to the application itself (i.e., the environment you are responsible for).

Keep in mind some general ideas while considering security for each aspect of your system:

**Limiting access**

Making smart choices that reduce possible entry points available to a malicious person.

**Containment**

Your system should be configured to minimize the amount of damage that can be done in the event that it is compromised.

**Preparation and knowledge**

Keeping backups and knowing the state of your WordPress installation at regular intervals. Having a plan to backup and recover your installation in the case of catastrophe can help you get back online faster in the case of a problem.

**Trusted Sources**

Do not get plugins/themes from untrusted sources. Restrict yourself to the [WordPress.org](http://WordPress.org) repository or well known companies. Trying to get plugins/themes from the outside [may lead to issues](http://blog.sucuri.net/2014/03/unmasking-free-premium-wordpress-plugins.html).

Make sure the computers you use are free of spyware, malware, and virus infections. No amount of security in WordPress or on your web server will make the slightest difference if there is a keylogger on your computer.

Always keep your operating system and the software on it, especially your web browser, up to date to protect you from security vulnerabilities. If you are browsing untrusted sites, we also recommend using tools like no-script (or disabling javascript/flash/java) in your browser.

Like many modern software packages, WordPress is updated regularly to address new security issues that may arise. Improving software security is always an ongoing concern, and to that end **you should always keep up to date with the latest version of WordPress**. Older versions of WordPress are not maintained with security updates.

Main article: [Updating WordPress](https://codex.wordpress.org/Updating%20WordPress).

The latest version of WordPress is always available from the main WordPress website at [https://wordpress.org](https://wordpress.org). Official releases are not available from other sites — **never** download or install WordPress from any website other than [https://wordpress.org](https://wordpress.org).

Since version 3.7, WordPress has featured automatic updates. Use this functionality to ease the process of keeping up to date. You can also use the WordPress Dashboard to keep informed about updates. Read the entry in the Dashboard or the WordPress Developer Blog to determine what steps you must take to update and remain secure.

If a vulnerability is discovered in WordPress and a new version is released to address the issue, the information required to exploit the vulnerability is almost certainly in the public domain. This makes old versions more open to attack, and is one of the primary reasons you should always keep WordPress up to date.

If you are an administrator in charge of more than one WordPress installation, consider using [Subversion](https://codex.wordpress.org/Installing/Updating_WordPress_with_Subversion) to make management easier.

If you think you have found a security flaw in WordPress, you can help by reporting the issue. See the [Security FAQ](https://codex.wordpress.org/Security%20FAQ) for information on how to report security issues.

If you think you have found a bug, report it. See [Submitting Bugs](https://codex.wordpress.org/Submitting%20Bugs) for how to do this. You might have uncovered a vulnerability, or a bug that could lead to one.

The web server running WordPress, and the software on it, can have vulnerabilities. Therefore, make sure you are running secure, stable versions of your web server and the software on it, or make sure you are using a trusted host that takes care of these things for you.

If you’re on a shared server (one that hosts other websites besides your own) and a website on the same server is compromised, your website can potentially be compromised too even if you follow everything in this guide. Be sure to ask your [web host](https://wordpress.org/support/article/glossary/#Hosting_provider) what security precautions they take.

The network on both ends — the WordPress server side and the client network side — should be trusted. That means updating firewall rules on your home router and being careful about what networks you work from. An Internet cafe where you are sending passwords over an unencrypted connection, wireless or otherwise, is **not** a trusted network.

Your web host should be making sure that their network is not compromised by attackers, and you should do the same. Network vulnerabilities can allow passwords and other sensitive information to be intercepted.

Many potential vulnerabilities can be avoided with good security habits. A strong password is an important aspect of this.

The goal with your password is to make it hard for other people to guess and hard for a [brute force attack](https://wordpress.org/support/article/brute-force-attacks/) to succeed. Many [automatic password generators](http://www.google.com/?q=password+generator)are available that can be used to create secure passwords.

WordPress also features a password strength meter which is shown when changing your password in WordPress. Use this when changing your password to ensure its strength is adequate.

Things to avoid when choosing a password:

- Any permutation of your own real name, username, company name, or name of your website.
- A word from a dictionary, in any language.
- A short password.
- Any numeric-only or alphabetic-only password (a mixture of both is best).

A strong password is necessary not just to protect your blog content. A hacker who gains access to your administrator account is able to install malicious scripts that can potentially compromise your entire server.

In addition to using a strong password, it’s a good idea to enable [two-step authentication](https://wordpress.org/documentation/article/two-step-authentication/) as an additional security measure.

When connecting to your server you should use SFTP encryption if your web host provides it. If you are unsure if your web host provides SFTP or not, just ask them.

Using SFTP is the same as FTP, except your password and other data is encrypted as it is transmitted between your computer and your website. This means your password is never sent in the clear and cannot be intercepted by an attacker.

Some neat features of WordPress come from allowing various files to be writable by the web server. However, allowing write access to your files is potentially dangerous, particularly in a shared hosting environment.

It is best to lock down your file permissions as much as possible and to loosen those restrictions on the occasions that you need to allow write access, or to create specific folders with less restrictions for the purpose of doing things like uploading files.

Here is one possible permission scheme.

All files should be owned by your user account, and should be writable by you. Any file that needs write access from WordPress should be writable by the web server, if your hosting set up requires it, that may mean those files need to be group-owned by the user account used by the web server process.

`/`

The root WordPress directory: all files should be writable only by your user account, except `.htaccess` if you want WordPress to automatically generate rewrite rules for you.

`/wp-admin/`

The WordPress administration area: all files should be writable only by your user account.

`/wp-includes/`

The bulk of WordPress application logic: all files should be writable only by your user account.

`/wp-content/`

User-supplied content: intended to be writable by your user account and the web server process.

Within `/wp-content/` you will find:

`/wp-content/themes/`

Theme files. If you want to use the built-in theme editor, all files need to be writable by the web server process. If you do not want to use the built-in theme editor, all files can be writable only by your user account.

`/wp-content/plugins/`

Plugin files: all files should be writable only by your user account.

Other directories that may be present with `/wp-content/` should be documented by whichever plugin or theme requires them. Permissions may vary.

If you have shell access to your server, you can change file permissions recursively with the following command:

For Directories:

find /path/to/your/wordpress/install/ -type d -exec chmod 755 {} ;

For Files:

find /path/to/your/wordpress/install/ -type f -exec chmod 644 {} ;

When you tell WordPress to perform an automatic update, all file operations are performed as the user that owns the files, not as the web server’s user. All files are set to 0644 and all directories are set to 0755, and writable by only the user and readable by everyone else, including the web server.

If you run multiple blogs on the same server, it is wise to consider keeping them in separate databases each managed by a different user. This is best accomplished when performing the initial [WordPress installation](https://codex.wordpress.org/Installing_WordPress). This is a containment strategy: if an intruder successfully cracks one WordPress installation, this makes it that much harder to alter your other blogs.

If you administer MySQL yourself, ensure that you understand your MySQL configuration and that unneeded features (such as accepting remote TCP connections) are disabled. See [Secure MySQL Database Design](http://www.securityfocus.com/infocus/1667) for a nice introduction.

For normal WordPress operations, such as posting blog posts, uploading media files, posting comments, creating new WordPress users and installing WordPress plugins, the MySQL database user only needs data read and data write privileges to the MySQL database; SELECT, INSERT, UPDATE and DELETE.

Therefore any other database structure and administration privileges, such as DROP, ALTER and GRANT can be revoked. By revoking such privileges you are also improving the containment policies.

**Note:** Some plugins, themes and major WordPress updates might require to make database structural changes, such as add new tables or change the schema. In such case, before installing the plugin or updating a software, you will need to temporarily allow the database user the required privileges.

**WARNING:** Attempting updates without having these privileges can cause problems when database schema changes occur. Thus, it is **NOT** recommended to revoke these privileges. If you do feel the need to do this for security reasons, then please make sure that you have a solid backup plan in place first, with regular whole database backups which you have tested are valid and that can be easily restored. A failed database upgrade can usually be solved by restoring the database back to an old version, granting the proper permissions, and then letting WordPress try the database update again. Restoring the database will return it back to that old version and the WordPress administration screens will then detect the old version and allow you to run the necessary SQL commands on it. Most WordPress upgrades do not change the schema, but some do. Only major point upgrades (3.7 to 3.8, for example) will alter the schema. Minor upgrades (3.8 to 3.8.1) will generally not. Nevertheless, **keep a regular backup**.

Adding server-side password protection (such as [BasicAuth](http://en.wikipedia.org/wiki/Basic_access_authentication)) to `/wp-admin/`adds a second layer of protection around your blog’s admin area, the login screen, and your files. This forces an attacker or bot to attack this second layer of protection instead of your actual admin files. Many WordPress attacks are carried out autonomously by malicious software bots.

Simply securing the `wp-admin/` directory might also break some WordPress functionality, such as the AJAX handler at `wp-admin/admin-ajax.php`. See the [Resources](https://codex.wordpress.org/#Resources) section for more documentation on how to password protect your `wp-admin/` directory properly.

The most common attacks against a WordPress blog usually fall into two categories.

1. Sending specially-crafted HTTP requests to your server with specific exploit payloads for specific vulnerabilities. These include old/outdated plugins and software.
2. Attempting to gain access to your blog by using “brute-force” password guessing.

The ultimate implementation of this “second layer” password protection is to require an HTTPS SSL encrypted connection for administration, so that all communication and sensitive data is encrypted. *See* [*Administration Over SSL*](https://codex.wordpress.org/Administration%20Over%20SSL)*.*

A second layer of protection can be added where scripts are generally not intended to be accessed by any user. One way to do that is to block those scripts using mod_rewrite in the .htaccess file. **Note:** to ensure the code below is not overwritten by WordPress, place it outside the `# BEGIN WordPress` and `# END WordPress` tags in the .htaccess file. WordPress can overwrite anything between these tags.

# Block the include-only files.

RewriteEngine On RewriteBase / RewriteRule ^wp-admin/includes/ - [F,L] RewriteRule !^wp-includes/ - [S=3] RewriteRule ^wp-includes/[^/]+.php$ - [F,L] RewriteRule ^wp-includes/js/tinymce/langs/.+.php - [F,L] RewriteRule ^wp-includes/theme-compat/ - [F,L]

# BEGIN WordPress

Note that this won’t work well on Multisite, as `RewriteRule ^wp-includes/[^/]+.php$ - [F,L]` would prevent the ms-files.php file from generating images. Omitting that line will allow the code to work, but offers less security.

You can move the `wp-config.php` file to the directory above your WordPress install. This means for a site installed in the root of your webspace, you can store `wp-config.php` outside the web-root folder.

**Note:** Some people assert that [moving wp-config.php has minimal security benefits](http://wordpress.stackexchange.com/q/58391/3898) and, if not done carefully, may actually introduce serious vulnerabilities. [Others disagree](http://wordpress.stackexchange.com/a/74972/24425).

Note that `wp-config.php` can be stored ONE directory level above the WordPress (where wp-includes resides) installation. Also, make sure that only you (and the web server) can read this file (it generally means a 400 or 440 permission).

If you use a server with .htaccess, you can put this in that file (at the very top) to deny access to anyone surfing for it:

order allow,deny deny from all The WordPress Dashboard by default allows administrators to edit PHP files, such as plugin and theme files. This is often the first tool an attacker will use if able to login, since it allows code execution. WordPress has a constant to disable editing from Dashboard. Placing this line in wp-config.php is equivalent to removing the ‘edit_themes’, ‘edit_plugins’ and ‘edit_files’ capabilities of all users: define('DISALLOW_FILE_EDIT', true); This will not prevent an attacker from uploading malicious files to your site, but might stop some attacks. First of all, make sure your plugins are always updated. Also, if you are not using a specific plugin, delete it from the system. There are many plugins and services that can act as a firewall for your website. Some of them work by modifying your .htaccess file and restricting some access at the Apache level, before it is processed by WordPress. A good example is [iThemes Security]([https://wordpress.org/plugins/better-wp-security/](https://wordpress.org/plugins/better-wp-security/)) or [All in One WP Security]([https://wordpress.org/plugins/all-in-one-wp-security-and-firewall/](https://wordpress.org/plugins/all-in-one-wp-security-and-firewall/)). Some firewall plugins act at the WordPress level, like [WordFence]([https://wordpress.org/plugins/wordfence/](https://wordpress.org/plugins/wordfence/)) and [Shield]([https://wordpress.org/plugins/wp-simple-firewall/](https://wordpress.org/plugins/wp-simple-firewall/)), and try to filter attacks as WordPress is loading, but before it is fully processed. Besides plugins, you can also install a WAF (web firewall) at your web server to filter content before it is processed by WordPress. The most popular open source WAF is ModSecurity. A website firewall can also be added as intermediary between the traffic from the internet and your hosting server. These services all function as reverse proxies, in which they accept the initial requests and reroute them to your server, stripping it of all malicious requests. They accomplish this by modifying your DNS records, via an A record or full DNS swap, allowing all traffic to pass through the new network first. This causes all traffic to be filtered by the firewall before reaching your site. A few companies offer such service, like [CloudFlare]([http://cloudflare.com/](http://cloudflare.com/)), [Sucuri]([https://sucuri.net/wordpress-security/](https://sucuri.net/wordpress-security/)) and [Incapsula]([http://www.incapsula.com/](http://www.incapsula.com/)). Additionally, these third parties service providers function as Content Distribution Network (CDNs) by default, introducing performance optimization and global reach. If a plugin wants write access to your WordPress files and directories, please read the code to make sure it is legit or check with someone you trust. Possible places to check are the [Support Forums]([https://codex.wordpress.org/Using_the_Support_Forums](https://codex.wordpress.org/Using_the_Support_Forums)) and [IRC Channel]([https://codex.wordpress.org/IRC](https://codex.wordpress.org/IRC)). As we said, part of the goal of hardening WordPress is containing the damage done if there is a successful attack. Plugins which allow arbitrary PHP or other code to execute from entries in a database effectively magnify the possibility of damage in the event of a successful attack. A way to avoid using such a plugin is to use [custom page templates]([https://wordpress.org/support/article/pages/#Creating_your_own_Page_Templates](https://wordpress.org/support/article/pages/#Creating_your_own_Page_Templates)) that call the function. Part of the security this affords is active only when you disallow file editing within WordPress. [Security through obscurity]([http://en.wikipedia.org/wiki/Security_through_obscurity](http://en.wikipedia.org/wiki/Security_through_obscurity)) is generally an unsound primary strategy. However, there are areas in WordPress where obscuring information _might_ help with security: 1. **Rename the administrative account:** When creating an administrative account, avoid easily guessed terms such as `admin` or `webmaster` as usernames because they are typically subject to attacks first. On an existing WordPress install you may rename the existing account in the MySQL command-line client with a command like `UPDATE wp_users SET user_login = 'newuser' WHERE user_login = 'admin';`, or by using a MySQL frontend like [phpMyAdmin]([https://codex.wordpress.org/phpMyAdmin](https://codex.wordpress.org/phpMyAdmin)). 2. **Change the table_prefix:** Many published WordPress-specific SQL-injection attacks make the assumption that the table_prefix is `wp_`, the default. Changing this can block at least some SQL injection attacks. Back up your data regularly, including your MySQL databases. See the main article: [Backing Up Your Database]([https://wordpress.org/support/article/backing-up-your-database/](https://wordpress.org/support/article/backing-up-your-database/)). Data integrity is critical for trusted backups. Encrypting the backup, keeping an independent record of MD5 hashes for each backup file, and/or placing backups on read-only media increases your confidence that your data has not been tampered with. A sound backup strategy could include keeping a set of regularly-timed snapshots of your entire WordPress installation (including WordPress core files and your database) in a trusted location. Imagine a site that makes weekly snapshots. Such a strategy means that if a site is compromised on May 1st but the compromise is not detected until May 12th, the site owner will have pre-compromise backups that can help in rebuilding the site and possibly even post-compromise backups which will aid in determining how the site was compromised. Logs are your best friend when it comes to understanding what is happening with your website, especially if you’re trying to perform forensics. Contrary to popular beliefs, logs allow you to see what was done and by who and when. Unfortunately the logs will not tell you who, username, logged in, but it will allow you to identify the IP and time and more importantly, the actions the attacker might have taken. You will be able to see any of these attacks via the logs – Cross Site Scripting (XSS), Remote File Inclusion (RFI), Local File Inclusion (LFI) and Directory Traversal attempts. You will also be able to see brute force attempts. There are various [examples and tutorials]([https://blog.sucuri.net/2015/08/ask-sucuri-how-did-my-wordpress-website-get-hacked-a-tutorial.html](https://blog.sucuri.net/2015/08/ask-sucuri-how-did-my-wordpress-website-get-hacked-a-tutorial.html)) available to help guide you through the process of parsing and analyzing your raw logs. If you get more comfortable with your logs you’ll be able to see things like, when the theme and plugin editors are being used, when someone updates your widgets and when posts and pages are added. All key elements when doing forensic work on your web server. The are a few WordPress Security plugins that assist you with this as well, like the [Sucuri Auditing tool]([https://wordpress.org/plugins/sucuri-scanner/](https://wordpress.org/plugins/sucuri-scanner/)) or the [Audit Trail]([https://wordpress.org/plugins/audit-trail/](https://wordpress.org/plugins/audit-trail/)) plugin. There are two key open-source solutions you’ll want on your web server from a security perspective, this is a layered approach to security. OSSEC can run on any NIX distribution and will also run on Windows. When configured correctly its very powerful. The idea is correlate and aggregate all the logs. You have to be sure to configure it to capture all access_logs and error_logs and if you have multiple websites on the server account for that. You’ll also want to be sure to filter out the noise. By default you’ll see a lot of noise and you’ll want to configure it to be really effective. Sometimes prevention is not enough and you may still be hacked. That’s why intrusion detection/monitoring is very important. It will allow you to react faster, find out what happened and recover your site. If you are on a dedicated or virtual private server, in which you have the luxury of root access, you have the ability easily configure things so that you can see what’s going on. [OSSEC]([http://www.ossec.net/](http://www.ossec.net/)) easily facilitates this and here is a little write up that might help you out [OSSEC for Website Security – Part I]([https://perezbox.com/2013/03/ossec-for-website-security-part-i/](https://perezbox.com/2013/03/ossec-for-website-security-part-i/)). When an attack happens, it always leave traces. Either on the logs or on the file system (new files, modified files, etc). If you are using [OSSEC]([http://www.ossec.net/](http://www.ossec.net/)) for example, it will monitor your files and alert you when they change. The goals of file system tracking include: - Monitor changed and added files - Log changes and additions - Ability to revert granular changes - Automated alerts Administrators can monitor file system via general technologies such as: - System utilities - Revision control - OS/kernel level monitoring Options for file system monitoring include: - [diff]([http://en.wikipedia.org/wiki/Diff_utility](http://en.wikipedia.org/wiki/Diff_utility)) – build clean test copy of your site and compare against production - [Git]([http://git-scm.com/](http://git-scm.com/)) – source code management - [inotify]([https://en.wikipedia.org/wiki/Inotify](https://en.wikipedia.org/wiki/Inotify)) and [incron]([http://inotify.aiken.cz/?section=incron&page=doc&lang=en](http://inotify.aiken.cz/?section=incron&page=doc&lang=en)) – OS kernel level file monitoring service that can run commands on filesystem events - [Watcher]([https://github.com/gregghz/Watcher/blob/master/jobs.yml](https://github.com/gregghz/Watcher/blob/master/jobs.yml)) – Python inotify library - [OSSEC]([http://ossec.net/](http://ossec.net/)) – Open Source Host-based Intrusion Detection System that performs log analysis, file integrity checking, policy monitoring, rootkit detection, real-time alerting and active response. When configuring a file based monitoring strategy, there are many considerations, including the following. ##### Run the monitoring script/service as root This would make it hard for attackers to disable or modify your file system monitoring solution. ##### Disable monitoring during scheduled maintenance/upgrades This would prevent unnecessary notifications when you are performing regular maintenance on the site. ##### Monitor only executable filetypes It may be reasonably safe to monitor only executable file types, such as .php files, etc.. Filtering out non-executable files may reduce unnecessary log entries and alerts. ##### Use strict file system permissions Read about securing file permissions and ownership. In general, avoid allowing _execute_ and _write_ permissions to the extent possible. If the attacker tries to deface your site or add malware, you can also detect these changes by using a web-based integrity monitor solution. This comes in many forms today, use your favorite search engine and look for Web Malware Detection and Remediation and you’ll likely get a long list of service providers.

#### File Permissions

1. All files should be owned by your user account and should be writable by you.
2. The root WordPress directory (/) should be writable only by your user account, except for .htaccess if you want WordPress to automatically generate rewrite rules for you.
3. The /wp-admin/ directory, which is the WordPress administration area, should be writable only by your user account.
4. The /wp-includes/ directory, which contains the bulk of WordPress application logic, should be writable only by your user account.
5. The /wp-content/ directory, which contains user-supplied content, should be intended to be writable by your user account and the web server process.
6. Within /wp-content/, you will find /wp-content/themes/ and /wp-content/plugins/. The Theme files in /wp-content/themes/ should be writable by the web server process if you want to use the built-in theme editor, and if you do not want to use the built-in theme editor, all files can be writable only by your user account. Plugin files in /wp-content/plugins/ should be writable only by your user account.
7. Other directories that may be present within /wp-content/ should be documented by whichever plugin or theme requires them, and permissions may vary.
- [ ] All files are owned by your user account and are writable by you.
- [ ] The root WordPress directory (/) is writable only by your user account, except for .htaccess if you want WordPress to automatically generate rewrite rules for you.
- [ ] The /wp-admin/ directory, which is the WordPress administration area, is writable only by your user account.
- [ ] The /wp-includes/ directory, which contains the bulk of WordPress application logic, is writable only by your user account.
- [ ] The /wp-content/ directory, which contains user-supplied content, is intended to be writable by your user account and the web server process.
- [ ] Within /wp-content/, you will find /wp-content/themes/ and /wp-content/plugins/. The Theme files in /wp-content/themes/ should be writable by the web server process if you want to use the built-in theme editor, and if you do not want to use the built-in theme editor, all files can be writable only by your user account. Plugin files in /wp-content/plugins/ should be writable only by your user account.
- [ ] Other directories that may be present within /wp-content/ should be documented by whichever plugin or theme requires them, and permissions may vary.
- [ ] All files are owned by your user account and are writable by you.
- Check file ownership: `ls -la /path/to/wordpress | grep ^- | awk '{print $3}' | uniq` (should return your username)
- Check file permissions: `ls -la /path/to/wordpress | grep ^- | awk '{print $1}'` (should include write permissions for your user account)
- [ ] The root WordPress directory (/) is writable only by your user account, except for .htaccess if you want WordPress to automatically generate rewrite rules for you.
- Check directory ownership: `ls -ld /path/to/wordpress` (should return your username)
- Check directory permissions: `ls -ld /path/to/wordpress` (should include write permissions for your user account and read/execute permissions for everyone else)
- [ ] The /wp-admin/ directory, which is the WordPress administration area, is writable only by your user account.
- Check directory ownership: `ls -ld /path/to/wordpress/wp-admin` (should return your username)
- Check directory permissions: `ls -ld /path/to/wordpress/wp-admin` (should include write permissions for your user account and read/execute permissions for everyone else)
- [ ] The /wp-includes/ directory, which contains the bulk of WordPress application logic, is writable only by your user account.
- Check directory ownership: `ls -ld /path/to/wordpress/wp-includes` (should return your username)
- Check directory permissions: `ls -ld /path/to/wordpress/wp-includes` (should include write permissions for your user account and read/execute permissions for everyone else)
- [ ] The /wp-content/ directory, which contains user-supplied content, is intended to be writable by your user account and the web server process.
- Check directory ownership: `ls -ld /path/to/wordpress/wp-content` (should return your username and the web server user, e.g. www-data)
- Check directory permissions: `ls -ld /path/to/wordpress/wp-content` (should include write permissions for your user account and the web server user, and read/execute permissions for everyone else)
- [ ] Within /wp-content/, you will find /wp-content/themes/ and /wp-content/plugins/. The Theme files in /wp-content/themes/ should be writable by the web server process if you want to use the built-in theme editor, and if you do not want to use the built-in theme editor, all files can be writable only by your user account. Plugin files in /wp-content/plugins/ should be writable only by your user account.
- Check theme directory permissions: `ls -ld /path/to/wordpress/wp-content/themes` (should include write permissions for the web server user if you want to use the built-in theme editor, and write permissions for your user account otherwise, and read/execute permissions for everyone else)
- Check plugin directory permissions: `ls -ld /path/to/wordpress/wp-content/plugins` (should include write permissions for your user account and read/execute permissions for everyone else)
- [ ] Other directories that may be present within /wp-content/ should be documented by whichever plugin or theme requires them, and permissions may vary.

# Shell Script Logging

```bash
You can log the output of a shell script to a text file by using the > or >> operator to redirect the output to a file.

The > operator will overwrite the file if it already exists, while the >> operator will append the output to the end of the file if it already exists.

Here's an example of how to use the > operator to log the output of a shell script to a file:

sh ./my-script.sh > my-script-output.txt
This will run my-script.sh and redirect the output to my-script-output.txt.

If you want to append the output to the end of the file instead, you can use the >> operator:

sh   5]k9./my-script.sh >> my-script-output.txt
This will run my-script.sh and append the output to the end of my-script-output.txt.

Note that if the file does not exist, it will be created automatically.
```

# Permission Testing Script

```bash
#!/bin/bash

read -p "Enter the path to your WordPress installation: " WP_PATH

# Check file ownership
if [[ $(ls -la $WP_PATH | grep ^- | awk '{print $3}' | uniq) == $(whoami) ]]; then
  echo "File ownership: OK"
else
  echo "File ownership: FAIL"
fi

# Check file permissions
if [[ $(ls -la $WP_PATH | grep ^- | awk '{print $1}' | grep -o u=w | wc -l) -ge 1 ]]; then
  echo "File permissions: OK"
else
  echo "File permissions: FAIL"
fi

# Check root directory ownership
if [[ $(ls -ld $WP_PATH | awk '{print $3}') == $(whoami) ]]; then
  echo "Root directory ownership: OK"
else
  echo "Root directory ownership: FAIL"
fi

# Check root directory permissions
if [[ $(ls -ld $WP_PATH | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "Root directory permissions: OK"
else
  echo "Root directory permissions: FAIL"
fi

# Check wp-admin directory ownership
if [[ $(ls -ld $WP_PATH/wp-admin | awk '{print $3}') == $(whoami) ]]; then
  echo "wp-admin directory ownership: OK"
else
  echo "wp-admin directory ownership: FAIL"
fi

# Check wp-admin directory permissions
if [[ $(ls -ld $WP_PATH/wp-admin | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "wp-admin directory permissions: OK"
else
  echo "wp-admin directory permissions: FAIL"
fi

# Check wp-includes directory ownership
if [[ $(ls -ld $WP_PATH/wp-includes | awk '{print $3}') == $(whoami) ]]; then
  echo "wp-includes directory ownership: OK"
else
  echo "wp-includes directory ownership: FAIL"
fi

# Check wp-includes directory permissions
if [[ $(ls -ld $WP_PATH/wp-includes | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "wp-includes directory permissions: OK"
else
  echo "wp-includes directory permissions: FAIL"
fi

# Check wp-content directory ownership
if [[ $(ls -ld $WP_PATH/wp-content | awk '{print $3,$4}') == "$(whoami) www-data" ]]; then
  echo "wp-content directory ownership: OK"
else
  echo "wp-content directory ownership: FAIL"
fi

# Check wp-content directory permissions
if [[ $(ls -ld $WP_PATH/wp-content | awk '{print $1}') == "drwxrwxr-x" ]]; then
  echo "wp-content directory permissions: OK"
else
  echo "wp-content directory permissions: FAIL"
fi

# Check theme directory permissions
if [[ $(ls -ld $WP_PATH/wp-content/themes | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "Theme directory permissions: OK"
else
  echo "Theme directory permissions: FAIL"
fi

# Check plugin directory permissions
if [[ $(ls -ld $WP_PATH/wp-content/plugins | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "Plugin directory permissions: OK"
else
  echo "Plugin directory permissions: FAIL"
fi
```

# Permission Fixing Script

```bash
#!/bin/bash

read -p "Enter the path to your WordPress installation: " WP_PATH

# Change file ownership
sudo chown -R $(whoami) $WP_PATH

# Change file permissions
sudo find $WP_PATH -type f -exec chmod 644 {} \;
sudo find $WP_PATH -type d -exec chmod 755 {} \;

# Change root directory permissions
sudo chmod 755 $WP_PATH
sudo chmod 644 $WP_PATH/.htaccess

# Change wp-admin directory permissions
sudo chmod -R 755 $WP_PATH/wp-admin

# Change wp-includes directory permissions
sudo chmod -R 755 $WP_PATH/wp-includes

# Change wp-content directory permissions
sudo chmod -R 755 $WP_PATH/wp-content
sudo chmod -R g+w $WP_PATH/wp-content
sudo chown -R $(whoami):www-data $WP_PATH/wp-content

# Change theme directory permissions
sudo chmod -R 755 $WP_PATH/wp-content/themes
sudo chown -R www-data:$(whoami) $WP_PATH/wp-content/themes

# Change plugin directory permissions
sudo chmod -R 755 $WP_PATH/wp-content/plugins

echo "Permissions have been updated according to the checklist."
```

# WPConfig

```bash
- [ ] Consider moving wp-config.php to the directory above your WordPress install for added security. Note that this may introduce vulnerabilities if not done carefully.
- [ ] If you choose to move wp-config.php, make sure it is stored one directory level above the WordPress installation (where wp-includes resides).
- [ ] Ensure that only you (and the web server) can read wp-config.php by setting its permissions to 400 or 440.
- [ ] If you use a server with .htaccess, you can add the following code to the file to deny access to anyone surfing for wp-config.php:
  
<files wp-config.php>
  order allow,deny
  deny from all
  </files>
```

# WPConfig Test Script

```bash
#!/bin/bash

read -p "Enter the path to your WordPress installation: " WP_PATH
WP_CONFIG="$WP_PATH/wp-config.php"

# Check if wp-config.php file exists
if [ ! -f "$WP_CONFIG" ]; then
  echo "wp-config.php does not exist."
  exit 1
fi

# Check if wp-config.php is writable by owner and not writable by group and others
if [ "$(stat -c '%a' $WP_CONFIG)" == "400" ] || [ "$(stat -c '%a' $WP_CONFIG)" == "440" ]; then
  echo "wp-config.php file permissions: OK"
else
  echo "wp-config.php file permissions: FAIL"
fi

# Check if wp-config.php is located one directory level above the WordPress installation
if [ "$(dirname $WP_CONFIG)" == "$(dirname $WP_PATH)/wp-includes" ]; then
  echo "wp-config.php location: OK"
else
  echo "wp-config.php location: FAIL"
fi

# Check if .htaccess file exists and contains the deny access code
HTACCESS="$WP_PATH/.htaccess"
if [ -f "$HTACCESS" ] && grep -q "<files wp-config.php>" "$HTACCESS"; then
  echo "Deny access code in .htaccess: OK"
else
  echo "Deny access code in .htaccess: FAIL"
fi
```

# WP Config Secure Script

```bash
#!/bin/bash

read -p "Enter the path to your WordPress installation: " WP_PATH
WP_CONFIG="$WP_PATH/wp-config.php"
HTACCESS="$WP_PATH/.htaccess"

# Check if wp-config.php file exists
if [ ! -f "$WP_CONFIG" ]; then
  echo "wp-config.php does not exist."
  exit 1
fi

# Move wp-config.php to one directory level above the WordPress installation
sudo mv $WP_CONFIG $(dirname $WP_PATH)

# Set wp-config.php file permissions to 400
sudo chmod 400 $(dirname $WP_PATH)/wp-config.php

# Add deny access code to .htaccess
if [ -f "$HTACCESS" ]; then
  if grep -q "<files wp-config.php>" "$HTACCESS"; then
    echo "Deny access code already exists in .htaccess."
  else
    echo "<files wp-config.php>" | sudo tee -a $HTACCESS
    echo "order allow,deny" | sudo tee -a $HTACCESS
    echo "deny from all" | sudo tee -a $HTACCESS
    echo "</files>" | sudo tee -a $HTACCESS
    echo "Deny access code added to .htaccess."
  fi
else
  echo "<files wp-config.php>" | sudo tee $HTACCESS
  echo "order allow,deny" | sudo tee -a $HTACCESS
  echo "deny from all" | sudo tee -a $HTACCESS
  echo "</files>" | sudo tee -a $HTACCESS
  echo ".htaccess file created with deny access code."
fi

echo "wp-config.php has been secured."
```

# Command List

- `ls`: list directory contents
- `grep`: print lines matching a pattern
- `awk`: pattern scanning and processing language
- `uniq`: report or omit repeated lines
- `chmod`: change file mode bits
- `chown`: change file owner and group
- `find`: search for files in a directory hierarchy
- `tee`: read from standard input and write to standard output and files
- `sudo`: execute a command as a superuser or another user
- `whoami`: print effective user ID
- `dirname`: strip last component from file name
- `stat`: display file or file system status

These commands are used in different ways to perform various tasks such as checking file ownership and permissions, changing file ownership and permissions, moving files, adding lines to files, and more. By using these commands, you can automate various tasks related to securing your WordPress installation, managing file permissions, and more.

# Browser Testing JS

```bash
// Check if site is using WordPress
if (!document.querySelector('meta[name="generator"][content^="WordPress"]')) {
  console.log('Site is not using WordPress');
} else {
  // Check wp-config.php file permissions
  fetch('wp-config.php')
    .then(response => {
      if (response.status === 200) {
        response.text().then(data => {
          const wpConfigPermissions = data.substring(0, data.indexOf('\n'));
          if (wpConfigPermissions.match(/^[-rwx]{4}[-rwx]{3}[-rwx]{3}$/)) {
            console.log(`VULNERABILITY: wp-config.php file is readable by others`);
          }
        });
      }
    });

  // Check .htaccess file permissions
  fetch('.htaccess')
    .then(response => {
      if (response.status === 200) {
        response.text().then(data => {
          const htaccessPermissions = data.substring(0, data.indexOf('\n'));
          if (htaccessPermissions.match(/^[-rwx]{4}[-rwx]{3}[-rwx]{3}$/)) {
            console.log(`VULNERABILITY: .htaccess file is readable by others`);
          }
        });
      }
    });

  // Check wp-content directory permissions
  fetch('wp-content/')
    .then(response => {
      if (response.status === 200) {
        response.text().then(data => {
          const wpContentPermissions = data.substring(0, data.indexOf('\n'));
          if (wpContentPermissions.match(/^d[-rwx]{4}[-rwx]{3}[-rwx]{3}$/)) {
            console.log(`VULNERABILITY: wp-content directory is readable by others`);
          }
        });
      }
    });

  // Check if debug mode is enabled
  fetch('wp-config.php')
    .then(response => {
      if (response.status === 200) {
        response.text().then(data => {
          const debugMode = data.match(/define\('WP_DEBUG',\s*(true|false)\)/);

          if (debugMode && debugMode[1] === 'true') {
            console.log(`VULNERABILITY: Debug mode is enabled`);
          }
        });
      }
    });

  // Check if error reporting is enabled
  fetch('wp-admin/')
    .then(response => {
      if (response.status === 200) {
        response.text().then(data => {
          const errorReporting = data.match(/<b>Fatal error<\/b>:\s*(.*?)<br>/);

          if (errorReporting) {
            console.log(`VULNERABILITY: Error reporting is enabled: ${errorReporting[1]}`);
          }
        });
      }
    });
}
```

