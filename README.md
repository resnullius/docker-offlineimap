# docker-offlineimap

## WHAT IS THIS?

Simple image to run `offlineimap` from within a docker image.

## HOW TO RUN IT?

    docker run --rm \
      -v $PWD/configs:/Configs \
      -v $PWD/secrets:/Secrets \
      -v $PWD/Mail:/Mail \
      resnullius/offlineimap

Expects `/Configs/offlineimaprc` to check and mail should be left on `/Mail` on
the `localfolders` value on `offlineimaprc`.

## Example offlineimaprc

    [general]
    ui = ttyui
    accounts = riseup
    maxsynaccounts = 1
    maxage = 365

    [Account riseup]
    localrepository = riseup-local
    remoterepository = riseup-remote
    autorefresh = 1
    quick = 10

    [Repository riseup-local]
    type = Maildir
    localfolders = /Mail/riseup

    [Repository riseup-remote]
    type = IMAP
    remotehost = mail.riseup.net
    remoteuser = user
    remotepassfile = /Secrets/riseup.pass
    sslcacertfile = /Secrets/riseup-ssl-certs.crt
    keepalive = 60
    holdconnectionopen = yes

    [mbnames]
    enabled = yes
    filename = /Configs/email/mailboxes
    header = "mailboxes "
    peritem = "+%(accountname)s/%(foldername)s"
    sep = " "
    footer = "\n"

## AUTHOR AND LICENSE
ⓒ 2017, Jose-Luis Rivas `<me@ghostbar.co>`.

This software is licensed under the MIT terms, you can find a copy of the
license on the `LICENSE` file in this repository.
