{ ... }: {
  environment.shellAliases = {
    dcup = "docker compose up";
    dcb = "docker compose build";
    dcrm = "docker compose rm";
    dcps = "docker compose ps";
    dcstop = "docker compose stop";
    dcrestart = "docker compose restart";
    dcr = "docker compose run";
  };
}
