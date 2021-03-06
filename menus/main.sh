#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 - Deiteq
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
export NCURSES_NO_UTF8_ACS=1
echo 'INFO - @Main PG Menu - GDrive Edition' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

edition=$( cat /var/plexguide/pg.edition ) 1>/dev/null 2>&1
version=$( cat /var/plexguide/pg.version ) 1>/dev/null 2>&1

HEIGHT=17
WIDTH=40
CHOICE_HEIGHT=11
BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
TITLE="$edition - $version"

OPTIONS=(A "Deploy a Mount System"
         B "PG Program Suite"
         C "PG PLEX Enhancement Tools"
         D "PG Server Security"
         E "PG Server Information"
         F "PG Troubleshooting Actions"
         G "PG Settings & Tools"
         H "PG Backup & Restore"
         I "PG Updates"
         J "Donation Menu"
         Z "Exit")

CHOICE=$(dialog --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
case $CHOICE in
        A)

##################################################### DEPLOYMENT SYSTEM - START
        HEIGHT=11
        WIDTH=44
        CHOICE_HEIGHT=5
        BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
        TITLE="Deploy a Mounting System"

        OPTIONS=(A "PGDrive   /w PG Move (Recommended)"
                 B "PGDrive   /w PG ST2  (Advanced)"
                 C "PlexDrive /w PG Move (Traditional)"
                 D "Mini FAQ"
                 Z "Exit")

        CHOICE=$(dialog --backtitle "$BACKTITLE" \
                        --title "$TITLE" \
                        --menu "$MENU" \
                        $HEIGHT $WIDTH $CHOICE_HEIGHT \
                        "${OPTIONS[@]}" \
                        2>&1 >/dev/tty)
        case $CHOICE in
                A)
                    echo "Move" > /var/plexguide/menu.select
                    bash /opt/plexguide/menus/mount/main.sh 
                    ;;
                B)
                    echo "SuperTransfer2" > /var/plexguide/menu.select
                    bash /opt/plexguide/menus/mount/main.sh
                    ;;
                C)
                    "plexdrive" > /var/plexguide/menu.select
                    bash /opt/plexguide/menus/plexdrive/rc-pd.sh 
                    ;;
                D)
                    ;;
                Z)
                    ;; ## Do Not Put Anything Here
        esac
            ;;
##################################################### DEPLOYMENT SYSTEM - END
        B)
            bash /opt/plexguide/menus/programs/main.sh ;;
        C)
echo 'INFO - Selected: PLEX Enhancements' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/plex/enhancement.sh ;;
        D)
echo 'INFO - Selected: PG Security Suite' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/security/main.sh ;;
        E)
echo 'INFO - Selected: PG Server Information' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/info-tshoot/info.sh ;;
        F)
echo 'INFO - Selected: Info & Troubleshoot' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/info-tshoot/tshoot.sh ;;
        G)
echo 'INFO - Selected: Settings' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/settings/main.sh ;;
        H)
echo 'INFO - Selected: Backup & Restore' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/backup-restore/main.sh ;;
        I)
echo 'INFO - Selected: PG Upgrades Interface' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/scripts/upgrade/main.sh
            bash /opt/plexguide/scripts/message/ending.sh
            exit 0 ;;
        J)
echo 'INFO - Selected: PDonations INterface' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/menus/donate/main.sh ;;
        Z)
echo 'INFO - Selected: Exit PlexGuide' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            bash /opt/plexguide/scripts/message/ending.sh
            exit 0 ;;
esac

## repeat menu when exiting
echo 'INFO - Looping: Main GDrive Interface Menu' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
bash /opt/plexguide/menus/main.sh
exit