{pkgs, ...}: {
  home.packages = with pkgs; [
    docker

    # languages servers
    docker-compose-language-service
    dockerfile-language-server-nodejs
  ];
}
