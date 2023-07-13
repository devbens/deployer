FROM instrumentisto/rsync-ssh:alpine3.18.2
LABEL "com.github.actions.name"="GitHub Action for One.com deployer"
LABEL "com.github.actions.description"="An action to deploy your repository to One.com via SSH"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/devbens/deployer"
LABEL "maintainer"="Ben Dev <b@kosmos.ae>"
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
