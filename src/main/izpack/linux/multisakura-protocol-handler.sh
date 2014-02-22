gconftool-2 -t string -s /desktop/gnome/url-handlers/sakuracoin/command "java -splash:doesnotexist.png -jar $INSTALL_PATH/multisakura-exe.jar %s"
gconftool-2 -s /desktop/gnome/url-handlers/sakuracoin/needs_terminal false -t bool
gconftool-2 -t bool -s /desktop/gnome/url-handlers/sakuracoin/enabled true
